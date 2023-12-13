import 'package:flutter/material.dart';

import '../container_expansion_widget.dart';

class BookTagWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _list = List.generate(
        40, (index) => Chip(label: Text('Боевик ' + index.toString())));
    return ContainerExpansionWidget(
      Wrap(
        alignment: WrapAlignment.start,
        direction: Axis.horizontal,
        children: _list,
      ),
      maxHeight: 50,
      trimExpandedText: 'свернуть',
      trimCollapsedText: 'развернуть',
    );
  }
}
