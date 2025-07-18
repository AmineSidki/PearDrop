import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:peardrop/FileDTO.dart';

dynamic receivedFile;
String filepath = "";

class Receiving extends StatelessWidget {
  @override
  Widget build(context) => _receiving();
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

Widget _receiving() {
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
    return Scaffold();
  }
}
