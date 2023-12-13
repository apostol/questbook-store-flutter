import 'package:basic/app/screen/search.dart';
import 'package:flutter/material.dart';

class SearchModalBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text('Найдите авторов, книги или посты'),
        TextFormField(
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.search),
            hintText: 'Введите астроку поиска',
            labelText: 'Поиск',
            border: OutlineInputBorder(),
          ),
          onSaved: (String? value) {
            // This optional block of code can be used to run
            // code when the user saves the form.
          },
          validator: (String? value) {
            return (value != null && value.contains('@'))
                ? 'Do not use the @ char.'
                : null;
          },
        ),
        Text('Подберите книгу по интересам'),
        ListTile(
          title: Text('Жанр'),
          trailing: Text('Любой'),
        ),
        ListTile(
          title: Text('Исключить жанр'),
          trailing: Text('Выбрать'),
        ),
        ListTile(
          title: Text('Сортировать'),
          trailing: Text('По популярности'),
        ),
        ExpansionTile(
          title: Text('Дополнительно'),
          expandedAlignment: Alignment.centerRight,
          childrenPadding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          children: [
            ListTile(
              title: Text('Статус'),
              trailing: Text('Не важно'),
            ),
            ListTile(
              title: Text('Форма'),
              trailing: Text('Любая'),
            ),
            ListTile(
              title: Text('Статус цикла'),
              trailing: Text('Не важно'),
            ),
            ListTile(
              title: Text('Скачивание'),
              trailing: Text('Не важно'),
            ),
            ListTile(
              title: Text('Доступ'),
              trailing: Text('Любой'),
            ),
            ListTile(
              title: Text('Последнее обновление'),
              trailing: Text('Не важно'),
            ),
            ListTile(
              title: Text('Опубликовано'),
              trailing: Text('Не важно'),
            ),
            ListTile(
              title: Text('Размер'),
              trailing: Text('Не важно'),
            ),
            ListTile(
              title: Text('Ознакомительные фрагменты'),
              trailing: Text('Скрывать'),
            ),
          ],
        ),
        ListTile(
            title: TextButton(
                onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchPage(),
                      ),
                    ),
                child: Text('Подобрать'))),
        ListTile(
            title:
                TextButton(onPressed: () => {}, child: Text('Сбросить все'))),
      ],
    );
  }
}
