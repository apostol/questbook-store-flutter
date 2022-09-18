import 'package:basic/app/screen/page/base_page.dart';
import 'package:basic/app/widget/appbar_widget.dart';
import 'package:basic/app/widget/drawer_widget.dart';
import 'package:basic/data/models/book_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/book_filter_cubit.dart';
import 'view/book_filter_view.dart';

class BookFilterPage extends BasePage {
  final BookFilterModel filter;
  const BookFilterPage({Key? key, required this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      drawer: DrawerWidget(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<BookFilterCubit>(
              create: (_) => BookFilterCubit(_, filter)),
        ],
        child: BookFilterView(),
      ),
    );
  }
}
