import 'package:basic/app/screen/page/base_page.dart';
import 'package:basic/app/screen/page/cubit/book_info_cubit.dart';
import 'package:basic/app/screen/page/view/book_info_view.dart';
import 'package:basic/app/widget/appbar_widget.dart';
import 'package:basic/app/widget/drawer_widget.dart';
import 'package:basic/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookInfoPage extends BasePage {
  final BookModel _book;

  const BookInfoPage({Key? key, required BookModel book}) : _book = book, super(key: key);

  // static Route route() {
  //   return MaterialPageRoute<void>(
  //       fullscreenDialog: true, builder: (_) => BookInfoPage());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      drawer: DrawerWidget(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<BookInfoCubit>(create: (_) => BookInfoCubit(_, _book)),
        ],
        child: BookInfoView(_book),
      ),
    );
  }
}
