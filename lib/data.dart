import 'dart:io';

abstract class PrepareData {
  static List<String> getData({required String path, required String pattern}) {
    File file = File(path);
    String data = file.readAsStringSync();
    List<String> dataSplited = data.split(pattern);
    return dataSplited;
  }
}
