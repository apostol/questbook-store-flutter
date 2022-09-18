import 'package:basic/app/screen/page/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/chats_cubit.dart';
import 'view/chats_view.dart';


/// {@template counter_page}
/// A [StatelessWidget] which is responsible for providing a
/// [CounterCubit] instance to the [CounterView].
/// {@endtemplate}
class ChatsPage extends BasePage {
  /// {@macro home_page}
  const ChatsPage({Key? key}) : super(key: key);
  static Route route(RouteSettings settings) {
    return MaterialPageRoute<void>(settings: settings, fullscreenDialog: true, builder: (_) => ChatsPage());
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatsCubit(),
      child: ChatsView(),
    );
  }
}