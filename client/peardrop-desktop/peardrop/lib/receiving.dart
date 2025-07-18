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

Future<void> askForFile(ip, s) async {
  try {
    final url = Uri.parse('http://$ip:8080/receive/$s');
    final response = await http.post(url);
    receivedFile = response.body;
  } catch (err) {
    throw Exception("Unsuccessful !");
  }
}

class _receiving extends State<Receiving> {
  dynamic s, ip;
  _receiving(this.s, this.ip);

  @override
  void initState() async {
    await askForFile(ip, s);
  }

  @override
  Widget build(BuildContext context) {
    try {
      FileDTO file = FileDTO.fromJson(jsonDecode(receivedFile));
      createLocalFile(file.fileName, file.fileBytes);
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
