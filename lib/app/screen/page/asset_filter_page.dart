import 'package:basic/app/screen/page/base_page.dart';
import 'package:basic/app/widget/appbar_widget.dart';
import 'package:basic/app/widget/drawer_widget.dart';
import 'package:basic/data/models/asset_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/asset_filter_cubit.dart';
import 'view/asset_filter_view.dart';

class AssetFilterPage extends BasePage {
  final AssetFilterModel filter;
  const AssetFilterPage({Key? key, required this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      drawer: DrawerWidget(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<AssetFilterCubit>(
              create: (_) => AssetFilterCubit(_, filter)),
        ],
        child: AssetFilterView(),
      ),
    );
  }
}
