import 'package:basic/data/models/book_model.dart';
import 'package:flutter/material.dart';

class BookTagGenreWidget extends StatelessWidget {
  BookTagGenreWidget(BookModel model);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Chip(label: Text('Боевая фантастика')),
        Chip(label: Text('18+'))
      ],),
    );
  }
}