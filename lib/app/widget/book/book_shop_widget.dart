import 'package:flutter/material.dart';

class BookShopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      FittedBox(child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
              onPressed: () => {}, child: Expanded(child: Text('Купить'))),
          TextButton(onPressed: () => {}, child: Text('Читать фрагмент')),
        ],
      )),
      FittedBox(child: Text('Только в мобильном приложении.'))
    ]));
  }
}
