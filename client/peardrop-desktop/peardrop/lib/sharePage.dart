import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';
import 'package:peardrop/devicesWidget.dart';
import 'package:peardrop/modeSwitchPage.dart';
import 'package:peardrop/startServer.dart';

dynamic incoming;
dynamic fileName;

class Sharepage extends StatefulWidget {
  @override
  State<Sharepage> createState() => _sharePage();
}

final NetworkInfo info = NetworkInfo();

void execStartServer() async {
  process = await startServer('s');
}

class _sharePage extends State<Sharepage> {
  @override
  void initState() {
    super.initState();
  }

  String text = "No files";
  bool isFilePresent = false;
  

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
                  "Drag and drop your file in the box",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropTarget(
                  onDragDone: (DropDoneDetails details) async {
                    if (details.files.length == 1) {
                      isFilePresent = true;
                      incoming = await details.files.elementAt(0).readAsBytes();
                      fileName = details.files.elementAt(0).name;
                      setState(() {
                        text = "Got File !\n📦";
                      });
                    }
                  },
                  onDragEntered: (_) {},
                  onDragExited: (_) {},
                  onDragUpdated: (_) {},
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 255, 148, 66),
                          Color.fromARGB(255, 255, 111, 0),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (isFilePresent) {
                      execStartServer();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Startserver('s'),
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 233, 200),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "Share",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 148, 66),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void postRequest(dynamic jsonMap) async {
  final ip = await info.getWifiIP();
  try {
    final url = Uri.parse('http://$ip:8080/share/file/receive');
    final response = await http.post(
      headers: {'Content-Type': 'application/json'},
      url,
      body: json.encode(jsonMap),
    );
    print(response.statusCode);
  } catch (err) {
    print(err);
  }
}
