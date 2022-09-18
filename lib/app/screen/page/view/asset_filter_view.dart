import 'package:basic/app/widget/book/book_description_widget.dart';
import 'package:basic/app/widget/book/book_detail_widget.dart';
import 'package:basic/app/widget/book/book_image_widget.dart';
import 'package:basic/app/widget/book/book_shop_widget.dart';
import 'package:basic/app/widget/book/book_statistic_widget.dart';
import 'package:basic/data/models/book_model.dart';
import 'package:flutter/material.dart';

class AssetFilterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _list =
        List.generate(20, (index) => _item(BookModel.test(index.toString())));
    return ListView(
      shrinkWrap: true,
      children: _list,
    );
  }

  Widget _item(BookModel model) {
    return Column(
      children: [
        Container(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 35,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [BookImageWidget(model), BookShopWidget()])),
                Expanded(
                    flex: 65,
                    child: FittedBox(
                        fit: BoxFit.fitHeight,
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            BookDetailWidget(model),
                            BookStatisticWidget(),
                          ],
                        ))),
              ],
            )),
        BookDescriptionWidget(),
      ],
    );
  }
}

/*
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 2 / 3,
              child: Column(children: [
                BookImageWidget(model),
                Divider(),
                BookShopWidget()
              ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: BookDetailWidget(model),
                  ),
                  Expanded(
                    flex: 1,
                    child: BookStatisticWidget(),
                  ),
                ],
              ),
            ),
            BookDescriptionWidget(),
          ],
        ),
*/
