import 'package:basic/app/screen/page/cubit/home_favorite_cubit.dart';
import 'package:basic/app/widget/book/book_list.dart';
import 'package:basic/data/models/book_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeGenreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<HomeFavoriteCubit, int>(
          builder: (context, state) {
            return _FavoriteScroll();
          },
        ),
      ),
    );
  }
}

class _FavoriteScroll extends StatefulWidget {
  _FavoriteScroll({Key? key}) : super(key: key);

  @override
  _FavoriteScrollState createState() => _FavoriteScrollState();
}

class _FavoriteScrollState extends State<_FavoriteScroll> {
  @override
  Widget build(BuildContext context) {
    var _popular_filter = BookFilterModel.POPULAR;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
                dense: true,
                horizontalTitleGap: 0,
                title: Row(
                  children: [
                    Chip(label: Text('label 1')),
                    Chip(label: Text('label 2')),
                    Chip(label: Text('label 3')),
                    Chip(label: Text('label 4')),
                    Chip(label: Text('label 5')),
                    Chip(label: Text('label 6')),
                    Chip(label: Text('label 7')),
                    Chip(label: Text('label 8')),
                  ],
                ),
                trailing: Icon(
                  Icons.thumbs_up_down_outlined,
                  color: Colors.pink,
                  size: 24.0,
                )),
            ListTile(
                dense: true,
                leading: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                title: Text('Популярное'),
                subtitle: Text('Самые популярные книги за сегодня'),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text('ВСЕ'),
                )),
            BookList(filter: _popular_filter),
            Divider(height: 10),
            ListTile(
                dense: true,
                title: Text('Горячие новинки'),
                subtitle: Text('Популярные новинки за последние 2 недели'),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text('ВСЕ'),
                )),
            BookList(filter: _popular_filter),
            Divider(height: 10),
            ListTile(
                dense: true,
                title: Text('Последние обновления'),
                subtitle: Text('Новые главы и фрагменты книг'),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text('ВСЕ'),
                )),
            BookList(filter: _popular_filter),
            Divider(height: 10),
            ListTile(
                dense: true,
                title: Text('Бестселлеры'),
                subtitle: Text('Самые популярные книги по подписке'),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text('ВСЕ'),
                )),
            BookList(filter: _popular_filter),
            Divider(height: 10),
            ListTile(
                dense: true,
                title: Text('Новые поступления'),
                subtitle: Text('Только что опубликованные произведения'),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text('ВСЕ'),
                )),
            BookList(filter: _popular_filter),
            Divider(height: 10),
            ListTile(
                dense: true,
                title: Text('Что сейчас читают'),
                subtitle:
                    Text('произведения, которые были добавлены в библиотеку'),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text('ВСЕ'),
                )),
            BookList(filter: _popular_filter),
            Divider(height: 10),
            ListTile(
                dense: true,
                title: Text('Читателям нравится'),
                subtitle: Text('Произведения, которым поставили ляйк'),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text('ВСЕ'),
                )),
            BookList(filter: _popular_filter),
            Divider(height: 10),
            ListTile(
                dense: true,
                title: Text('Вы интересовались'),
                subtitle: Text('Книги, которые вы недавно просматривали'),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text('ВСЕ'),
                )),
            BookList(filter: _popular_filter),
          ],
        ),
      ),
    );
  }
}
