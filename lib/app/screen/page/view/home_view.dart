import 'package:basic/app/screen/page/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_favorite_view.dart';
import 'home_genre_view.dart';

class HomeView extends StatefulWidget {
  @override
  _StatisticsViewState createState() => _StatisticsViewState();
}

class _StatisticsViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(_tabChanged);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void _tabChanged() {
    // Check if Tab Controller index is changing, otherwise we get the notice twice
    if (_tabController.indexIsChanging) {
      print('tabChanged: ${_tabController.index}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeCubit, int>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                  //constraints: BoxConstraints.expand(height: 30),
                  child: TabBar(
                controller: _tabController,
                automaticIndicatorColorAdjustment: true,
                labelColor: Colors.black54,
                unselectedLabelColor: Colors.black38,
                tabs: [
                  Tab(
                    text: "Мои предпочтения",
                  ),
                  Tab(text: "Все жанры"),
                ],
              )),
              Expanded(
                  child: TabBarView(
                controller: _tabController,
                children: [
                  HomeFavoriteView(),
                  HomeGenreView(),
                ],
              ))
            ],
          );
        },
      ),
    );
  }
}
