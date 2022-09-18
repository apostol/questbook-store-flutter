import 'package:basic/app/screen/page/base_page.dart';
import 'package:basic/app/widget/appbar_widget.dart';
import 'package:basic/app/widget/drawer_widget.dart';
import 'package:basic/data/models/user_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/user_filter_cubit.dart';
import 'view/user_filter_view.dart';

class UserFilterPage extends BasePage {
  final UserFilterModel filter;
  const UserFilterPage({Key? key, required this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      drawer: DrawerWidget(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<UserFilterCubit>(
              create: (_) => UserFilterCubit(_, filter)),
        ],
        child: UserFilterView(),
      ),
    );
  }
}
