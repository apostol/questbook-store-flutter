import 'package:basic/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookStatusWidget extends StatelessWidget {
  BookStatusWidget(BookModel model);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Chip(label: Text('в процессе')),
          Text(' '),
          Text('вчера 11:10'),
        ],
      ),
    );
  }
}
