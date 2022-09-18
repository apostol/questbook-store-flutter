import 'package:basic/app/screen/page/base_page.dart';
import 'package:basic/app/screen/page/cubit/settings_cubit.dart';
import 'package:basic/app/screen/page/view/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends BasePage {
  /// {@macro home_page}
  const SettingsPage({Key? key}) : super(key: key);
  static Route route(RouteSettings settings) {
    return MaterialPageRoute<void>(settings: settings, fullscreenDialog: true, builder: (_) => SettingsPage());
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit(),
      child: SettingsView(),
    );
  }
}