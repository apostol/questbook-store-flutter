import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookStatisticWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.favorite_outline, 'Нравиться', 932),
        _buildButtonColumn(color, Icons.thumb_up_outlined, 'Награды', 14),
        _buildButtonColumn(
            color, Icons.comment_bank_outlined, 'Комментарии', 1433),
      ],
    );
  }

  Widget _buildButtonColumn(
      Color color, IconData icon, String label, int count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(children: [Icon(icon, color: color), Text(count.toString())]),
        Container(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
