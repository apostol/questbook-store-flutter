import 'package:basic/data/models/book_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'book_serial_widget.dart';
import 'book_tag_genre_widget.dart';
import 'book_statistic_word_widget.dart';
import 'book_status_widget.dart';

class BookDetailWidget extends StatelessWidget {
  final BookModel model;
  BookDetailWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(model.title),
        RichText(
            text: TextSpan(
                text: model.author,
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print("Author click!");
                  })),
        BookStatusWidget(model),
        BookStatisticWordWidget(model),
        BookTagGenreWidget(model),
        BookSerialWidget(model),
      ],
    );
  }
}
