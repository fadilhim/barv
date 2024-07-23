import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;

class BarvFileUploader {
  static Future<String> convertFormat(File file) async {
    final base64String = base64Encode(await file.readAsBytes());
    final extension = _getFileExtension(file);
    final prefix = 'data:image/$extension;base64,';
    return prefix + base64String;
  }

  static String convertName(File file) {
    final name = path.basename(file.path);
    return name;
  }

  static String _getFileExtension(File file) {
    final extName = path.extension(file.path);
    final parts = extName.split('.');
    if (parts.length > 1) {
      var res = parts.last;
      if (res == 'jpg') {
        res = 'jpeg';
      }
      return res;
    } else {
      return '';
    }
  }
}
