import 'package:basic/app/screen/page/cubit/book_info_cubit.dart';
import 'package:basic/app/widget/book/book_comment_widget.dart';
import 'package:basic/app/widget/book/book_comment_writer_widget.dart';
import 'package:basic/app/widget/book/book_description_widget.dart';
import 'package:basic/app/widget/book/book_detail_widget.dart';
import 'package:basic/app/widget/book/book_image_widget.dart';
import 'package:basic/app/widget/book/book_menu_widget.dart';
import 'package:basic/app/widget/book/book_shop_widget.dart';
import 'package:basic/app/widget/book/book_statistic_widget.dart';
import 'package:basic/app/widget/book/book_tag_widget.dart';
import 'package:basic/app/widget/book/book_user_reaction_widget.dart';
import 'package:basic/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookInfoView extends StatefulWidget {
  final BookModel model;
  BookInfoView(BookModel book) : model = book;

  @override
  _BookInfoViewState createState() => _BookInfoViewState();
}

class _BookInfoViewState extends State<BookInfoView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<BookInfoCubit, int>(builder: (context, state) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 800) {
              return SingleChildScrollView(
                  child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BookImageWidget(widget.model),
                      Expanded(
                          child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BookDetailWidget(widget.model), //BookDetail
                          Divider(),
                          BookStatisticWidget(), //BookStatistics
                          Divider(),
                          BookShopWidget(), //BookShop
                          Divider(),
                          BookUserReactionWidget(), //BookUserStatus
                        ],
                      )),
                    ],
                  ),
                  Divider(),
                  BookDescriptionWidget(), //BookDescription
                  Divider(),
                  BookTagWidget(), //BookTags
                  Divider(),
                  BookMenuWidget(), //BookMenu
                  Divider(),
                  BookCommentWriterWidget(), //BookCommentWriter
                  Divider(),
                  BookCommentWidget(), //BookComments
                ],
              ));
            } else {
              return SingleChildScrollView(
                  child: Column(
                children: [
                  BookImageWidget(widget.model),
                  BookDetailWidget(widget.model), //BookDetail
                  Divider(),
                  BookStatisticWidget(), //BookStatistics
                  Divider(),
                  BookShopWidget(), //BookShop
                  Divider(),
                  BookUserReactionWidget(), //BookUserStatus
                  Divider(),
                  BookDescriptionWidget(), //BookDescription
                  Divider(),
                  BookTagWidget(), //BookTags
                  Divider(),
                  BookMenuWidget(), //BookMenu
                  Divider(),
                  BookCommentWriterWidget(), //BookCommentWriter
                  Divider(),
                  BookCommentWidget(), //BookComments
                ],
              ));
            }
          },
        );
      }),
    );
  }
}
