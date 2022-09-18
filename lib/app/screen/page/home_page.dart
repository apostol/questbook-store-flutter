import 'package:basic/app/screen/page/base_page.dart';
import 'package:basic/app/screen/page/cubit/home_cubit.dart';
import 'package:basic/app/screen/page/view/home_view.dart';
import 'package:basic/app/widget/appbar_widget.dart';
import 'package:basic/app/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/home_favorite_cubit.dart';
import 'cubit/home_genre_cubit.dart';

class HomePage extends BasePage {
  /// {@macro home_page}
  const HomePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        fullscreenDialog: true, builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      drawer: DrawerWidget(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<HomeCubit>(create: (_) => HomeCubit()),
          BlocProvider<HomeFavoriteCubit>(create: (_) => HomeFavoriteCubit()),
          BlocProvider<HomeGenreCubit>(create: (_) => HomeGenreCubit()),
        ],
        child: HomeView(),
      ),
    );
  }
}
