import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'model.dart';

abstract class Provider<T extends Model> {
  final String collection;
  Provider(this.collection);

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<T> write<T>(Model model) async {
    final id = model.id;
    final path = await _localPath;
    final file = File('$path/$collection$id.json');
    file.writeAsString(jsonEncode(model));
    return model as T;
  }

  Future<Map<String, dynamic>> read<T>(String? id) async {
    final path = await _localPath;
    final file = File('$path/$collection$id.json');
    final contents = await file.readAsString();
    final Map<String, dynamic> model = jsonDecode(contents);
    return Future.value(model);
  }

  Future<FileSystemEntity> delete(T model) async {
    final path = await _localPath;
    final id = model.id;
    final file = File('$path/$collection$id.json');
    return file.delete();
  }
}
