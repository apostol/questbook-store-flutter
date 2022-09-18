import 'package:basic/data/bloc/authentication/authentication_bloc.dart';
import 'package:basic/data/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasePage extends StatelessWidget {

  const BasePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => BasePage());
  }

  @override
  Widget build(BuildContext context) {
    switch (BlocProvider.of<AuthenticationBloc>(context).state.status){
      case AuthenticationStatus.unauthenticated:
      case AuthenticationStatus.unknown:
        Navigator.pushReplacementNamed(context, '/login');
        break;
      case AuthenticationStatus.authenticated:
      default:
        break;
    }
    throw ''; //TODO
  }
}