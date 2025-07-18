import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';
import 'package:peardrop/receivePage.dart';
import 'package:peardrop/sharePage.dart';

class Startserver extends StatefulWidget {
  var mode;
  Startserver(this.mode);

  @override
  State<Startserver> createState() => _createState(mode);
}

final info = NetworkInfo();

Future<String> checkAlive(ip) async {
  try {
    final url = Uri.parse('http://$ip:8080/health/alive');
    final response = await http.post(url);
    return response.body;
  } catch (err) {
    return '';
  }
}

class _createState extends State<Startserver> {
  String mode;
  _createState(this.mode);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) async {
      final ip = await info.getWifiIP();
      String res = await checkAlive(ip);
      if (res.isNotEmpty) {
        switch (mode) {
          case 's':
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Sharepage()),
            );
            timer.cancel();
            break;
          case 'r':
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Receivepage()),
            );
            timer.cancel();
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 72,
        title: Text(
          "PearDrop",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
        shadowColor: Colors.black,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Container(child: Text("Starting server ..")),
    );
  }
}
