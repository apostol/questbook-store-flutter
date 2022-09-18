import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookMenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListTile(
        leading: Icon(Icons.show_chart),
        title: Text('Информация и статистика'),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.format_list_bulleted),
        title: Text('Оглавление'),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.content_copy),
        title: Text('Цикл'),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.present_to_all),
        title: Text('Награды'),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.library_books),
        title: Text('Рицензии'),
        onTap: () {},
      ),
    ]);
  }
}
