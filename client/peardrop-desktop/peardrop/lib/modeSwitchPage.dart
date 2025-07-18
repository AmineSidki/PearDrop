import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:peardrop/receivePage.dart';
import 'package:peardrop/sharePage.dart';
import 'package:peardrop/startServer.dart';

class ModeSwitchPage extends StatefulWidget {
  static dynamic context = context;

  @override
  State<ModeSwitchPage> createState() => _initState();
}

Future<void> startServer(String mode, process) async {
  try {
    final appDocDir = await getApplicationDocumentsDirectory(); 
    print(appDocDir);
    final jarPath = '${appDocDir.path}/peardropServer.jar';
    process = await Process.start('java', [
      '-jar',
      jarPath,
      '--mode=$mode',
    ], runInShell: true);

  } catch (err) {
    print(err);
  }
}

void stopServer(Process process) {
  process.kill();
}

class _initState extends State<ModeSwitchPage> {
  static var process;

  @override
  void initState() {
    super.initState();
    if (process != null) {
      stopServer(process);
    }
  }

  @override
  Widget build(context) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "What will it be today ?",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            SizedBox(height: 19),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    await startServer('r', process);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Startserver('r')),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 50),
                    height: 302,
                    width: 342,
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
                          Color.fromARGB(255, 85, 255, 0),
                          Color.fromARGB(255, 51, 153, 0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 115),
                          child: SvgPicture.asset("assets/images/Arrow.svg"),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Receive",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 23.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    await startServer('s', process);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Startserver('s')),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 50),
                    height: 302,
                    width: 342,
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
                          Color.fromARGB(255, 255, 204, 0),
                          Color.fromARGB(255, 255, 115, 0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 115),
                          child: Transform.rotate(
                            angle: 3.14,
                            child: SvgPicture.asset("assets/images/Arrow.svg"),
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Send",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40.0,
                          ),
                        ),
                      ],
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
