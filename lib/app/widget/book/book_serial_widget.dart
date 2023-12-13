import 'package:basic/data/models/book_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BookSerialWidget extends StatelessWidget {
  final BookModel model;
  BookSerialWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text('Цикл:'),
          RichText(
              text: TextSpan(
                  text: 'Название цикла #7',
                  style: TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print("Список книг в цикле");
                    })),
        ],
      ),
    );
  }
}
