import 'package:basic/app/screen/page/base_page.dart';
import 'package:basic/app/screen/page/cubit/profile_cubit.dart';
import 'package:basic/app/screen/page/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends BasePage {
  /// {@macro home_page}
  const ProfilePage({Key? key}) : super(key: key);
  static Route route(RouteSettings settings) {
    return MaterialPageRoute<void>(settings: settings, fullscreenDialog: true, builder: (_) => ProfilePage());
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProfileCubit(context),
      child: ProfileView(),
    );
  }
}