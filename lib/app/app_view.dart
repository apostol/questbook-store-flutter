import 'package:basic/data/bloc/authentication/authentication_bloc.dart';
import 'package:basic/data/repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screen/about.dart';
import 'screen/home.dart';
import 'screen/login.dart';
import 'screen/profile.dart';
import 'screen/settings.dart';
import 'screen/welcome.dart';

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;

  final Map<String, WidgetBuilder> _routes = {
    '/': (_) => WelcomePage(),
    '/login': (_) => LoginPage(),
    '/home': (_) => HomePage(),
    '/settings': (_) => SettingsPage(),
    '/profile': (_) => ProfilePage(),
    '/about': (_) => AboutPage(),
    '/home/category1/add': (_) => HomePage(),
    '/home/category2/add': (_) => HomePage(),
    '/home/category3/add': (_) => HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Quest-book Today',
        routes: _routes,
        builder: (context, child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              switch (state.status) {
                case AuthenticationStatus.unauthenticated:
                  _navigator.pushAndRemoveUntil<void>(
                      LoginPage.route(), (route) => false);
                  break;
                case AuthenticationStatus.authenticated:
                  _navigator.pushAndRemoveUntil<void>(
                      HomePage.route(), (route) => false);
                  break;
                default:
                  break;
              }
            },
            child: child,
          );
        });
  }
}
