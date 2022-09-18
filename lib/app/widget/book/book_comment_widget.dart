import 'package:basic/app/widget/comment/comment_tree_widget.dart';
import 'package:basic/app/widget/comment/tree_theme_data.dart';
import 'package:basic/data/models/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../container_expansion_widget.dart';

class BookCommentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerExpansionWidget(
      CommentTreeWidget<CommentModel, CommentModel>(
        CommentModel(
            id: '0',
            user: 'null',
            userName: 'null',
            content: 'felangel made felangel/cubit_and_beyond public '),
        [
          CommentModel(
              id: '1',
              user: 'null',
              userName: 'null',
              content: 'A Dart template generator which helps teams'),
          CommentModel(
              id: '2',
              user: 'null',
              userName: 'null',
              content:
                  'A Dart template generator which helps teams generator which helps teams generator which helps teams'),
          CommentModel(
              id: '3',
              user: 'null',
              userName: 'null',
              content: 'A Dart template generator which helps teams'),
          CommentModel(
              id: '4',
              user: 'null',
              userName: 'null',
              content:
                  'A Dart template generator which helps teams generator which helps teams '),
        ],
        treeThemeData: TreeThemeData(lineColor: Colors.green, lineWidth: 3),
        avatarRoot: (context, data) => PreferredSize(
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage('assets/avatar_2.png'),
          ),
          preferredSize: Size.fromRadius(18),
        ),
        avatarChild: (context, data) => PreferredSize(
          child: CircleAvatar(
            radius: 12,
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage('assets/avatar_1.png'),
          ),
          preferredSize: Size.fromRadius(12),
        ),
        contentChild: (context, data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'dangngocduc',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${data.content}',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          fontWeight: FontWeight.w300, color: Colors.black),
                    ),
                  ],
                ),
              ),
              DefaultTextStyle(
                style: Theme.of(context).textTheme.caption!.copyWith(
                    color: Colors.grey[700], fontWeight: FontWeight.bold),
                child: Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Text('Like'),
                      SizedBox(
                        width: 24,
                      ),
                      Text('Reply'),
                    ],
                  ),
                ),
              )
            ],
          );
        },
        contentRoot: (context, data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'dangngocduc',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${data.content}',
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          fontWeight: FontWeight.w300, color: Colors.black),
                    ),
                  ],
                ),
              ),
              DefaultTextStyle(
                style: Theme.of(context).textTheme.caption!.copyWith(
                    color: Colors.grey[700], fontWeight: FontWeight.bold),
                child: Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Text('Like'),
                      SizedBox(
                        width: 24,
                      ),
                      Text('Reply'),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
      trimExpandedText: 'свернуть',
      trimCollapsedText: 'развернуть',
    );
  }
}
