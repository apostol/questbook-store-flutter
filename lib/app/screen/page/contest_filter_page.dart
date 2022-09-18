import 'package:basic/app/screen/page/base_page.dart';
import 'package:basic/app/widget/appbar_widget.dart';
import 'package:basic/app/widget/drawer_widget.dart';
import 'package:basic/data/models/contest_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/contest_filter_cubit.dart';
import 'view/contest_filter_view.dart';

class ContestFilterPage extends BasePage {
  final ContestFilterModel filter;
  const ContestFilterPage({Key? key, required this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      drawer: DrawerWidget(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<ContestFilterCubit>(
              create: (_) => ContestFilterCubit(_, filter)),
        ],
        child: ContestFilterView(),
      ),
    );
  }
}
