part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final ProfileStatus status;
  final ProfileModel profile;

  const ProfileState._({
    this.status = ProfileStatus.unknown,
    this.profile = ProfileModel.empty
  });

  const ProfileState.unknown() : this._();

  const ProfileState.read(ProfileModel profile)
      : this._(status: ProfileStatus.read, profile: profile);


  const ProfileState.updated(ProfileModel profile)
      : this._(status: ProfileStatus.updated, profile: profile);

  const ProfileState.created(ProfileModel profile)
      : this._(status: ProfileStatus.created, profile: profile);

  const ProfileState.deleted(ProfileModel profile)
      : this._(status: ProfileStatus.deleted, profile: profile);

  @override
  List<Object> get props => [status, profile];

}
