import 'package:basic/app/widget/comment/tree_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'comment_child_widget.dart';
import 'root_comment_widget.dart';

typedef AvatarWidgetBuilder<T> = PreferredSize Function(BuildContext context, T value);
typedef ContentBuilder<T> = Widget Function(BuildContext context, T value);

class CommentTreeWidget<R, C> extends StatefulWidget {
  static const ROUTE_NAME = 'CommentTreeWidget';

  final R root;
  final List<C> replies;

  final AvatarWidgetBuilder<R> avatarRoot;
  final ContentBuilder<R> contentRoot;

  final AvatarWidgetBuilder<C> avatarChild;
  final ContentBuilder<C> contentChild;
  final TreeThemeData treeThemeData;

  CommentTreeWidget(
      this.root,
      this.replies,
      {
        this.treeThemeData = const TreeThemeData(lineColor: Colors.grey, lineWidth: 1),
        required this.avatarRoot,
        required this.contentRoot,
        required this.avatarChild,
        required this.contentChild
      });

  @override
  _CommentTreeWidgetState<R, C> createState() => _CommentTreeWidgetState<R, C>();
}

class _CommentTreeWidgetState<R, C> extends State<CommentTreeWidget<R, C>> {

  @override
  Widget build(BuildContext context) {
    PreferredSize avatarRoot = widget.avatarRoot(context, widget.root);
    return Provider<TreeThemeData>.value(
      value: widget.treeThemeData,
      child: Container(
        child: Column(
          children: [
            RootCommentWidget(
              avatarRoot,
              widget.contentRoot(context, widget.root),
            ),
            ...widget.replies.map((e) => CommentChildWidget(
              isLast: widget.replies.indexOf(e) == (widget.replies.length - 1),
              avatar: widget.avatarChild(context, e),
              avatarRoot: avatarRoot.preferredSize,
              content: widget.contentChild(context, e),
            ))
          ],
        ),
      ),
    );
  }
}
