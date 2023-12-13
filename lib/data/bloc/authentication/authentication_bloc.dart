import 'dart:async';
import 'package:basic/data/models/profile_model.dart';
import 'package:basic/data/provider/preferences_provider.dart';
import 'package:basic/data/repository/authentication_repository.dart';
import 'package:basic/data/repository/profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  final ProfileRepository _profileRepository;
  late StreamSubscription<AuthenticationStatus> _authenticationStatusSubscription;

  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
    required ProfileRepository profileRepository })
      : _authenticationRepository = authenticationRepository,
        _profileRepository = profileRepository,
        super(const AuthenticationState.unknown())
  {
    on<AuthenticationStatusChanged>(_AuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_AuthenticationLogoutRequested);
    on<AuthenticationLoginEmpty>(_AuthenticationLoginEmpty);
    on<AuthenticationLoginVK>(_AuthenticationLoginVK);

    _authenticationStatusSubscription = _authenticationRepository.status.listen(
            (status) => add(AuthenticationStatusChanged(status))
    );
    _authenticationRepository.init();
  }


  _AuthenticationStatusChanged(AuthenticationStatusChanged event, Emitter<AuthenticationState> emit) {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
      case AuthenticationStatus.authenticated:
        _tryGetProfile().then((profile) => profile != null ? AuthenticationState.authenticated(profile) : AuthenticationState.unauthenticated());
        break;
      default:
        AuthenticationState.unknown();
    }
  }

  _AuthenticationLogoutRequested(AuthenticationLogoutRequested event, Emitter<AuthenticationState> emit) {
    _authenticationRepository.logOut();
    AuthenticationState.unknown();
  }

  _AuthenticationLoginEmpty(AuthenticationLoginEmpty event, Emitter<AuthenticationState> emit) {
    _authenticationRepository.logIn().then((user) {
      _authenticationRepository.user.then((_user) {
        PreferencesProvider.getUID().then((uid) {
          _profileRepository.update(
            ProfileModel(
              uid,
              user!.userId,
              user.created.toIso8601String(),
              _user.name,
              '',
              _user.name,
              _user.photo!,
              _user.email!,
              '',
              ''
          ));
          _mapAuthenticationStatusChangedToState(AuthenticationStatusChanged(AuthenticationStatus.authenticated));
        });
      });
    });
  }

  _AuthenticationLoginVK(AuthenticationLoginVK event, Emitter<AuthenticationState> emit) {
    _authenticationRepository.logIn().then((user) {
      _authenticationRepository.user.then((_user) {
        PreferencesProvider.getUID().then((uid) {
          _profileRepository.update(
            ProfileModel(
              uid,
              user!.userId,
              user.created.toIso8601String(),
              _user.name,
              '',
              _user.name,
              _user.photo!,
              _user.email!,
              '',
              ''
          ));
          _mapAuthenticationStatusChangedToState(AuthenticationStatusChanged(AuthenticationStatus.authenticated));
        });
      });
    });
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }

  Future<AuthenticationState> _mapAuthenticationStatusChangedToState(
      AuthenticationStatusChanged event,
      ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
      case AuthenticationStatus.authenticated:
        final profile = await _tryGetProfile();
        return profile != null
            ? AuthenticationState.authenticated(profile)
            : const AuthenticationState.unauthenticated();
      default:
        return const AuthenticationState.unknown();
    }
  }

  Future<ProfileModel?> _tryGetProfile() async {
    try {
      final profile = await _profileRepository.read();
      return profile;
    } on Exception {
      return null;
    }
  }
}