import 'dart:async';
import 'package:basic/data/models/profile_model.dart';
import 'package:basic/data/provider/preferences_provider.dart';
import 'package:basic/data/repository/profile_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;
  late StreamSubscription _profileStatusSubscription;

  ProfileBloc(BuildContext context) :
        _profileRepository = ProfileRepository(),
        super(const ProfileState.unknown()){

    on<ProfileStatusChanged>(_ProfileStatusChanged);
    on<ProfileEventCreate>(_ProfileEventCreate);
    on<ProfileEventRead>(_ProfileEventRead);
    on<ProfileEventDelete>(_ProfileEventDelete);
    on<ProfileEventUpdate>(_ProfileEventUpdate);
    _profileStatusSubscription = _profileRepository.status.listen(
            (status) => add(ProfileStatusChanged(status))
    );
  }

  _ProfileStatusChanged(ProfileStatusChanged event, Emitter<ProfileState> emit) {
    _mapProfileStatusChangedToState(event);
  }

  _ProfileEventCreate(ProfileEventCreate event, Emitter<ProfileState> emit) {
    _profileRepository.create(ProfileModel.empty).then((value) => ProfileState.created(value));
  }

  _ProfileEventRead(ProfileEventRead event, Emitter<ProfileState> emit) {
    ProfileState.read(_profileRepository.profile!);
  }

  _ProfileEventDelete(ProfileEventDelete event, Emitter<ProfileState> emit) {
    _profileRepository.delete(_profileRepository.profile!);
  }

  _ProfileEventUpdate(ProfileEventUpdate event, Emitter<ProfileState> emit) {
    PreferencesProvider.getUID().then((uid) {
      final _profile = ProfileModel(
            uid,
            event.profile.id,
            event.profile.registeredAt,
            event.profile.firstName,
            event.profile.lastName,
            event.profile.nickName,
            event.profile.photo,
            event.profile.email,
            event.profile.phone,
            event.profile.location);
      _profileRepository.update(_profile);
      ProfileState.updated(_profile);
    });
  }

  @override
  Future<void> close() {
    _profileStatusSubscription.cancel();
    _profileRepository.dispose();
    return super.close();
  }

  Future<ProfileState> _mapProfileStatusChangedToState(
      ProfileStatusChanged event,
      ) async {
      var _profile = _profileRepository.profile;
    switch (event.status) {
      case ProfileStatus.created:
        return ProfileState.created(_profile!);
      case ProfileStatus.read:
        return ProfileState.read(_profile!);
      case ProfileStatus.updated:
        return ProfileState.updated(_profile!);
      case ProfileStatus.deleted:
        return ProfileState.unknown();

      default:
        return ProfileState.unknown();
    }
  }
}
