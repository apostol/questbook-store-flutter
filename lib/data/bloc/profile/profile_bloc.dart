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
    _profileStatusSubscription = _profileRepository.status.listen(
            (status) => add(ProfileStatusChanged(status))
    );
  }

  @override
  Future<void> close() {
    _profileStatusSubscription.cancel();
    _profileRepository.dispose();
    return super.close();
  }

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is ProfileStatusChanged) {
      yield await _mapProfileStatusChangedToState(event);
    } else if (event is ProfileEventCreate) {
      final _profile = await _profileRepository.create(ProfileModel.empty);
      yield ProfileState.created(_profile);
    } else if (event is ProfileEventRead){
      ProfileModel? _profile = _profileRepository.profile;
      yield ProfileState.read(_profile!);
    } else if (event is ProfileEventUpdate){
      final _profile = ProfileModel(
          PreferencesProvider.getUID(),
          event.profile.id,
          event.profile.registeredAt,
          event.profile.firstName,
          event.profile.lastName,
          event.profile.nickName,
          event.profile.photo,
          event.profile.email,
          event.profile.phone,
          event.profile.location);
      await _profileRepository.update(_profile);
      yield ProfileState.updated(_profile);
    } else if (event is ProfileEventDelete){
      ProfileModel? _profile = _profileRepository.profile;
      await _profileRepository.delete(_profile!);
      yield ProfileState.deleted(_profile);
    } else {
      yield ProfileState.unknown();
    }
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
