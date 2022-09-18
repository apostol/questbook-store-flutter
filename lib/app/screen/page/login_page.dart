import 'package:basic/app/screen/page/base_page.dart';
import 'package:basic/app/screen/page/cubit/login_cubit.dart';
import 'package:basic/app/screen/page/view/login_view.dart';
import 'package:basic/app/screen/page/view/welcome_view.dart';
import 'package:basic/data/bloc/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends BasePage  {

  static Route route() {
    return MaterialPageRoute<void>(fullscreenDialog: true, builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (_) => LoginCubit(context.read<AuthenticationBloc>()),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              if (!state.intro){
                Future.delayed(
                    Duration(seconds: 5),
                    ()=>context.read<LoginCubit>().emit(state.copyWith(
                        logged: state.logged, intro: true)));
                return WelcomeView();
              }
              return LoginView();
            },
          ),
        ),
      );
  }
}