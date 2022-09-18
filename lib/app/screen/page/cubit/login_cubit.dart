import 'package:basic/data/bloc/authentication/authentication_bloc.dart';
import 'package:basic/data/repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationBloc) : super(const LoginState()) {
    _authenticationBloc.stream.listen((event) {
      if (event.status == AuthenticationStatus.authenticated) {
        emit(LoginState(logged: true, intro: state.intro));
      }
    });
  }

  final AuthenticationBloc _authenticationBloc;

  Future<void> logIn() async {
    if (state.logged) return;
    //TODO: _authenticationBloc.add(AuthenticationLoginVK());
    _authenticationBloc.add(AuthenticationLoginEmpty());
  }
}

class LoginState extends Equatable {
  const LoginState({this.logged = false, this.intro = false});

  final bool logged;
  final bool intro;

  @override
  List<Object> get props => [logged, intro];

  LoginState copyWith({logged, intro}) {
    return LoginState(
      logged: logged,
      intro: intro,
    );
  }
}
