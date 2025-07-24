import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';
import 'package:peardrop/receivePage.dart';
import 'package:peardrop/sharePage.dart';
import 'package:peardrop/sharing.dart';

class Startserver extends StatefulWidget {
  var mode;
  Startserver(this.mode);

  @override
  State<Startserver> createState() => _createState(mode);
}

final info = NetworkInfo();

Future<String> checkAlive(ip) async {
  try {
    final url = Uri.parse('http://$ip:8080/health/isalive');
    final response = await http.get(url);
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
      if (res == 'Hello') {
        switch (mode) {
          case 's':
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Sharing()),
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
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.white),
        child: Container(
          height: 250,
          width: 600,
          decoration: BoxDecoration(
            color: const Color.fromARGB(46, 86, 86, 86),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Starting server",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  fontSize: 50,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20,),
              CircularProgressIndicator(
                backgroundColor: const Color.fromARGB(7, 158, 158, 158),
                strokeWidth: 10.0,
                constraints: BoxConstraints(
                  minWidth: 70,
                  maxWidth: 70,
                  minHeight: 70,
                  maxHeight: 70,
                ),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
