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
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
            (status) => add(AuthenticationStatusChanged(status))
    );
    _authenticationRepository.init();
  }

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event,
      ) async* {
    if (event is AuthenticationStatusChanged) {
      yield await _mapAuthenticationStatusChangedToState(event);
    } else if (event is AuthenticationLogoutRequested) {
      _authenticationRepository.logOut();
    } else if (event is AuthenticationLoginEmpty) {
      var user = await _authenticationRepository.logIn();
      var _user = await _authenticationRepository.user;
      var _profile = ProfileModel(
          await PreferencesProvider.getUID(),
          user!.userId,
          user.created.toIso8601String(),
          _user.name,
          '',
          _user.name,
          _user.photo!,
          _user.email!,
          '',
          ''
      );
      await _profileRepository.update(_profile);
      yield await _mapAuthenticationStatusChangedToState(
          AuthenticationStatusChanged(AuthenticationStatus.authenticated));
    } else if (event is AuthenticationLoginVK) {
      var user = await _authenticationRepository.logIn();
      var _user = await _authenticationRepository.user;
      var _profile = ProfileModel(
          await PreferencesProvider.getUID(),
          user!.userId,
          user.created.toIso8601String(),
          _user.name,
          '',
          _user.name,
          _user.photo!,
          _user.email!,
          '',
          ''
      );
      await _profileRepository.update(_profile);
      yield await _mapAuthenticationStatusChangedToState(
          AuthenticationStatusChanged(AuthenticationStatus.authenticated));
    }
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