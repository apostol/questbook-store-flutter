import 'package:basic/app/screen/page/base_page.dart';
import 'package:basic/app/widget/appbar_widget.dart';
import 'package:basic/app/widget/drawer_widget.dart';
import 'package:basic/data/models/artwork_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/artwork_filter_cubit.dart';
import 'view/artwork_filter_view.dart';

class ArtworkFilterPage extends BasePage {
  final ArtworkFilterModel filter;
  const ArtworkFilterPage({Key? key, required this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      drawer: DrawerWidget(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<ArtworkFilterCubit>(
              create: (_) => ArtworkFilterCubit(_, filter)),
        ],
        child: ArtworkFilterView(),
      ),
    );
  }
}
