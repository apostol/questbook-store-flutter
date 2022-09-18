import 'package:basic/app/screen/page/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/genres_cubit.dart';
import 'view/genres_view.dart';

/// {@template counter_page}
/// A [StatelessWidget] which is responsible for providing a
/// [CounterCubit] instance to the [CounterView].
/// {@endtemplate}
class GenresPage extends BasePage {
  /// {@macro home_page}
  const GenresPage({Key? key}) : super(key: key);
  static Route route(RouteSettings settings) {
    return MaterialPageRoute<void>(
        settings: settings,
        fullscreenDialog: true,
        builder: (_) => GenresPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GenresCubit(),
      child: GenresView(),
    );
  }
}
