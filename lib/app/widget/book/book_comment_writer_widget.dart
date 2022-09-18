import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookCommentWriterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ListTile(
            leading: Icon(Icons.comment),
            title: Text('Комментариев: 100500'),
            isThreeLine: true,
            dense: true,
            subtitle: TextField(),
          ),
          TextButton(onPressed: () => {}, child: Text('Послать'))
        ],
      ),
    );
  }
}
