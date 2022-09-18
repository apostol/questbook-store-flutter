import 'package:basic/data/models/book_filter_model.dart';
import 'package:basic/data/models/book_model.dart';
import 'package:flutter/widgets.dart';
import 'book_cover.dart';

class BookList extends StatelessWidget {
  final BookFilterModel filter;

  const BookList({Key? key, required this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _list = List.generate(
        20, (index) => BookCover(BookModel.test(index.toString())));

    return Container(
      height: 250,
      child: ListView(
        //shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: _list,
      ),
    );
  }
}
