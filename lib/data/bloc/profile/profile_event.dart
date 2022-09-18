part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class ProfileStatusChanged extends ProfileEvent {
  const ProfileStatusChanged(this.status);
  final ProfileStatus status;
  @override
  List<Object?> get props => [status];
}

class ProfileEventRead extends ProfileEvent {
  const ProfileEventRead(this.profile);
  final ProfileModel? profile;
  @override
  List<Object?> get props => [profile];
}

class ProfileEventCreate extends ProfileEvent {
  const ProfileEventCreate(this.profile);
  final ProfileModel? profile;
  @override
  List<Object?> get props => [profile];
}


class ProfileEventUpdate extends ProfileEvent {
  const ProfileEventUpdate(this.profile);
  final ProfileModel profile;
  @override
  List<Object> get props => [profile];
}

class ProfileEventDelete extends ProfileEvent {
  const ProfileEventDelete(this.profile);
  final ProfileModel profile;
  @override
  List<Object> get props => [profile];
}