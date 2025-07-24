import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:peardrop/devicesWidget.dart';
import 'package:peardrop/modeSwitchPage.dart';

class Receivepage extends StatefulWidget {
  @override
  State<Receivepage> createState() => defaultState();
}

final NetworkInfo info = NetworkInfo();

class defaultState extends State<Receivepage> {
  @override
  void initState()  {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        leading: GestureDetector(
          onTap: () async {
             String? ip = await info.getWifiIP();
            stopServer(ip);
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(left: 10.5, top: 14, bottom: 13),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 217, 217, 217),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: Text(""),
          ),
        ),
        title: Text(
          "PearDrop",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
        shadowColor: Colors.black,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Nearby devices :",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            SizedBox(height: 19),
            DevicesContainer(),
          ],
        ),
      ),
    );
  }
}
