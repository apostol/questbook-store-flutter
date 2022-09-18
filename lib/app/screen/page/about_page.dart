import 'package:basic/app/screen/page/base_page.dart';
import 'package:basic/app/screen/page/cubit/about_cubit.dart';
import 'package:basic/app/screen/page/view/about_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/// {@template counter_page}
/// A [StatelessWidget] which is responsible for providing a
/// [CounterCubit] instance to the [CounterView].
/// {@endtemplate}
class AboutPage extends BasePage {
  /// {@macro home_page}
  const AboutPage({Key? key}) : super(key: key);
  static Route route(RouteSettings settings) {
    return MaterialPageRoute<void>(settings: settings, fullscreenDialog: true, builder: (_) => AboutPage());
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AboutCubit(),
      child: AboutView(),
    );
  }
}