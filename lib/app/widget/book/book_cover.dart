import 'package:basic/app/screen/book_info.dart';
import 'package:basic/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookCover extends StatelessWidget {
  final BookModel model;

  BookCover(this.model) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      padding: EdgeInsets.all(2.0),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookInfoPage(book: model),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(5.0),
                  ),
                  child: Image.network(model.photo, fit: BoxFit.fill),
                ),
                Container(
                  color: Colors.amber,
                  child: Text('эксклюзив'),
                )
              ],
            ),
            ListTile(
              dense: true,
              title: FittedBox(child: Text(model.title)),
              subtitle: Text(
                model.author,
                textAlign: TextAlign.right,
              ),
            ),
            Divider(
              height: 1,
            ),
            Text(
              model.price,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
