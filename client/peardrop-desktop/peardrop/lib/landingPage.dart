import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'modeSwitchPage.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    execGetJarPath();
    return _landingPage(context);
  }
}

void execGetJarPath() async {
  print(await getJarPath());
}

Future<String> getJarPath() async {
  final appDir = await getApplicationDocumentsDirectory();
  final jarFile = File('${appDir.path}/peardropServer.jar');

  if (!await jarFile.exists()) {
    final byteData = await rootBundle.load('assets/peardropServer.jar');
    jarFile.create();
    jarFile.writeAsBytes(byteData.buffer.asInt8List());
  }

  return jarFile.path;
}

Widget _landingPage(context) {
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
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Column(
            children: [
              Expanded(child: SizedBox(height: 493)),
              Container(
                margin: EdgeInsets.only(left: 21),
                child: Text(
                  "Share ,\nUnconditionally .",
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(),
              alignment: Alignment.centerRight,
              child: Image.asset("assets/images/PearImage.png"),
            ),
          ),
        ],
      ),
    ),
    bottomNavigationBar: Container(
      decoration: BoxDecoration(color: Colors.white),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ModeSwitchPage()),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 343.0),
              height: 65,
              width: 343,

              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(57, 0, 0, 0),
                    blurRadius: 10,
                    offset: Offset.fromDirection(1.57, 5.0),
                  ),
                ],
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 81, 169, 37),
                    Color.fromARGB(255, 85, 255, 0),
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              margin: EdgeInsets.only(left: 12, right: 12, top: 57, bottom: 20),
              alignment: Alignment.center,
              child: Text(
                "Start",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Roboto",
                  fontSize: 30.0,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
