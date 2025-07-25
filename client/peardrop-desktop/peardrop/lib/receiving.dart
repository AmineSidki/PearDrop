import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:peardrop/FileDTO.dart';

dynamic receivedFile;
String filepath = "";

class Receiving extends StatefulWidget {
  dynamic s, ip;
  Receiving(this.s, this.ip);

  @override
  State<Receiving> createState() => _receiving(s, ip);
}

Future<String> getLocalPath() async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<File> createLocalFile(String filename, Int8List content) async {
  final path = await getLocalPath();
  final file = File('$path/$filename');
  print(path);
  return file.writeAsBytes(content);
}

Future<bool> askForFile(ip, s) async {
  try {
    final url = Uri.parse('http://$ip:8080/receive/$s');
    final response = await http.post(url);
    receivedFile = response.body;
    return true;
  } catch (err) {
    return false;
  }
}

class _receiving extends State<Receiving> {
  dynamic s, ip;
  _receiving(this.s, this.ip);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) async {
      if ((await askForFile(ip, s))) {
        FileDTO fileDTO = FileDTO.fromJson(jsonDecode(receivedFile));
        File created = await createLocalFile(
          fileDTO.fileName,
          fileDTO.fileBytes,
        );

        setState(() {
          filepath = created.path;
        });
        timer.cancel();
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    try {
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
        body: Container(child: Text(filepath)),
      );
    } catch (err) {
      print(err);
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
      );
    }
  }
}
