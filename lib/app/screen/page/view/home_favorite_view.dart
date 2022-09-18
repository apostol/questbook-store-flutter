import 'package:basic/app/screen/page/cubit/home_favorite_cubit.dart';
import 'package:basic/app/widget/book/book_list.dart';
import 'package:basic/data/models/book_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../book_filter_page.dart';

class HomeFavoriteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<HomeFavoriteCubit, int>(
      builder: (context, state) {
        return _FavoriteScroll();
      },
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
    var _hot_filter = BookFilterModel.HOT;
    var _updated_filter = BookFilterModel.LAST_UPDATED;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ListTile(
                dense: true,
                leading: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                title: Text(_popular_filter.name),
                subtitle: Text(_popular_filter.description),
                trailing: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BookFilterPage(filter: _popular_filter),
                      ),
                    );
                  },
                  child: Text('ВСЕ'),
                )),
            BookList(filter: _popular_filter),
            Divider(height: 10),
            ListTile(
                dense: true,
                title: Text(_hot_filter.name),
                subtitle: Text(_hot_filter.description),
                trailing: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BookFilterPage(filter: _hot_filter),
                      ),
                    );
                  },
                  child: Text('ВСЕ'),
                )),
            BookList(filter: _hot_filter),
            Divider(height: 10),
            ListTile(
                dense: true,
                title: Text(_updated_filter.name),
                subtitle: Text(_updated_filter.description),
                trailing: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BookFilterPage(filter: _updated_filter),
                      ),
                    );
                  },
                  child: Text('ВСЕ'),
                )),
            BookList(filter: _updated_filter),
            Divider(height: 10),
            ListTile(
                dense: true,
                title: Text('Бестселлеры'),
                subtitle: Text('Самые популярные книги по подписке'),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text('ВСЕ'),
                )),
            BookList(filter: _updated_filter),
            Divider(height: 10),
            ListTile(
                dense: true,
                title: Text('Новые поступления'),
                subtitle: Text('Только что опубликованные произведения'),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text('ВСЕ'),
                )),
            BookList(filter: _updated_filter),
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
            BookList(filter: _updated_filter),
            Divider(height: 10),
            ListTile(
                dense: true,
                title: Text('Читателям нравится'),
                subtitle: Text('Произведения, которым поставили ляйк'),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text('ВСЕ'),
                )),
            BookList(filter: _updated_filter),
            Divider(height: 10),
            ListTile(
                dense: true,
                title: Text('Вы интересовались'),
                subtitle: Text('Книги, которые вы недавно просматривали'),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text('ВСЕ'),
                )),
            BookList(filter: _updated_filter),
          ],
        ),
      ),
    );
  }
}
