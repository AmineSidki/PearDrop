import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';
import 'package:peardrop/receivePage.dart';
import 'package:peardrop/sharePage.dart';

class Sharing extends StatefulWidget {
  @override
  State<Sharing> createState() => _createState();
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

class _createState extends State<Sharing> {
  @override
  void initState() {
    super.initState();
    postRequest({"fileBytes": incoming, "fileName": fileName});
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
            color: const Color.fromARGB(45, 255, 183, 0),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "File is sharing !",
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  fontSize: 50,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(
                backgroundColor: const Color.fromARGB(7, 158, 158, 158),
                strokeWidth: 10.0,
                constraints: BoxConstraints(
                  minWidth: 70,
                  maxWidth: 70,
                  minHeight: 70,
                  maxHeight: 70,
                ),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
