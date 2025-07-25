import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';
import 'package:peardrop/receiving.dart';

class DevicesContainer extends StatefulWidget {
  @override
  State<DevicesContainer> createState() => defaultDeviceContainer();
}

Timer? periodicTimer;

class defaultDeviceContainer extends State<DevicesContainer> {
  Container con = Container();
  Column col = Column();

  @override
  void initState() {
    super.initState();

    periodicTimer = Timer.periodic(Duration(seconds: 3), (timer) async {
      Column column = await callLocalServer(col, context);

      if (!mounted) return;
      setState(() {
        con = Container(
          alignment: Alignment.center,
          height: 600,
          width: 500,
          margin: EdgeInsets.only(bottom: 23),
          decoration: BoxDecoration(
            color: Color.fromARGB(100, 217, 217, 217),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: column,
            ),
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    periodicTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: con);
  }
}

final info = NetworkInfo();

Future<Column> callLocalServer(Column col, context) async {
  final info = NetworkInfo();
  final ip = await info.getWifiIP();

  try {
    final url = Uri.parse('http://$ip:8080/receive/devices');
    final response = await http.get(url);

    List<String> bracketlessBody = response.body.split("\"");
    List<String> devices = bracketlessBody.elementAt(1).split(",");
    List<Widget> devicesButtons = [];

    for (String s in devices) {
      print(s);
      devicesButtons.add(
        GestureDetector(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Receiving(s , ip)),
            ),
          },
          child: Container(
            margin: EdgeInsets.only(left: 19, top: 19),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(
                          255,
                          Random().nextInt(255),
                          Random().nextInt(255),
                          Random().nextInt(255),
                        ),
                        Color.fromARGB(
                          255,
                          Random().nextInt(255),
                          Random().nextInt(255),
                          Random().nextInt(255),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 19),
                Text(
                  s,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Column(children: devicesButtons);
  } catch (err) {
    return Column(children: []);
  }
}
