import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';


class FileDTO {
  Int8List fileBytes;
  String fileName;
  FileDTO(this.fileBytes, this.fileName);

  factory FileDTO.fromJson(Map<String, dynamic> json) {
    List<dynamic> rawBytes = json['fileBytes'];
    final Int8List bytes = Int8List.fromList(rawBytes.cast<int>());

    String fileName = json['fileName'];
    return FileDTO(bytes , fileName);
  }
}
