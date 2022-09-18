import 'package:flutter/material.dart';

class ContainerExpansionWidget extends StatefulWidget {
  const ContainerExpansionWidget(
    this.text, {
    Key? key,
    this.maxHeight = 50.0,
    this.trimExpandedText = ' read less',
    this.trimCollapsedText = ' ...read more',
  }) : super(key: key);

  final Widget text;
  final double maxHeight;
  final String? trimExpandedText;
  final String? trimCollapsedText;

  @override
  _ContainerExpansionWidgetState createState() =>
      _ContainerExpansionWidgetState();
}

class _ContainerExpansionWidgetState extends State<ContainerExpansionWidget>
    with TickerProviderStateMixin<ContainerExpansionWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      AnimatedSize(
          vsync: this,
          duration: const Duration(milliseconds: 500),
          child: ConstrainedBox(
            constraints: isExpanded
                ? BoxConstraints()
                : BoxConstraints(maxHeight: widget.maxHeight),
            child: widget.text,
          )),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
              child: Text(
                  '${isExpanded ? widget.trimExpandedText : widget.trimCollapsedText}',
                  style: TextStyle(color: Colors.green)),
              onPressed: () => setState(() => isExpanded = !isExpanded))
        ],
      )
    ]);
  }
}
