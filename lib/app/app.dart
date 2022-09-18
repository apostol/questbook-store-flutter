import 'package:basic/data/bloc/application/application_bloc.dart';
import 'package:basic/data/bloc/profile/profile_bloc.dart';
import 'package:basic/data/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:basic/data/bloc/authentication/authentication_bloc.dart';
import 'package:basic/data/repository/authentication_repository.dart';
import 'package:basic/app/app_view.dart';

class App extends StatelessWidget {
  final AuthenticationRepository authenticationRepository = AuthenticationRepository();
  final ProfileRepository profileRepository = ProfileRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (_) => AuthenticationBloc(
              authenticationRepository: authenticationRepository,
              profileRepository: profileRepository
            )
          ),
          BlocProvider<ApplicationBloc>(
            create: (_) => ApplicationBloc(_)
          ),
          BlocProvider<ProfileBloc>(
            create: (_) => ProfileBloc(_)
          )
        ],
        child: AppView(),
      ),
    );
  }
}