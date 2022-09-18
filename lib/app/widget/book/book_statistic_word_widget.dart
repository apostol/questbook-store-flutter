import 'package:basic/data/models/book_model.dart';
import 'package:flutter/widgets.dart';

class BookStatisticWordWidget extends StatelessWidget {
  BookStatisticWordWidget(BookModel model);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [Text('100500 знаков'), Text(','), Text('0.75 ал.')],
      ),
    );
  }
}
