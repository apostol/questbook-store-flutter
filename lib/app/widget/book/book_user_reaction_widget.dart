import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookUserReactionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Chip(label: Text('Читаю')),
          IconButton(
              onPressed: () => {},
              icon: Icon(
                Icons.ac_unit,
                semanticLabel: 'Написать рецензию',
              )),
          IconButton(
              onPressed: () => {},
              icon: Icon(
                Icons.ac_unit,
                semanticLabel: 'Ссылка на произведение',
              )),
          IconButton(
              onPressed: () => {},
              icon: Icon(
                Icons.ac_unit,
                semanticLabel: 'Пожаловаться',
              ))
        ],
      )
    );
  }
}
