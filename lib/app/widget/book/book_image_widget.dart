import 'package:basic/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookImageWidget extends StatelessWidget {
  final BookModel model;
  BookImageWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      child: Image.network(model.photo, fit: BoxFit.fill),
    );
  }
}
