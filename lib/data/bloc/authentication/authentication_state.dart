part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.profile = ProfileModel.empty,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(ProfileModel? profile)
      : this._(status: AuthenticationStatus.authenticated, profile: profile);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);


  final AuthenticationStatus status;
  final ProfileModel? profile;

  @override
  List<Object?> get props => [status, profile];
}