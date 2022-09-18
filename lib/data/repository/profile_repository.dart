import 'dart:async';

import 'package:basic/data/models/profile_model.dart';
import 'package:basic/data/provider.dart';
import 'package:basic/data/provider/preferences_provider.dart';
import 'package:basic/data/provider/profile_provider.dart';
import 'package:synchronized/synchronized.dart';

enum ProfileStatus { updated, created, deleted, read, unknown }

class ProfileRepository {
  final _controller = StreamController<ProfileStatus>();
  ProfileModel? _profile;
  Lock _lock = Lock();

  Stream<ProfileStatus> get status async* {
    yield ProfileStatus.unknown;
    yield* _controller.stream;
  }

  final Provider _profileProvider;
  ProfileRepository({ProfileProvider? profileProvider})  : _profileProvider = profileProvider ?? ProfileProvider()
  {
    read();
  }

  ProfileModel? get profile => _profile;

  read() async {
    _lock.synchronized(() async {
      _profile =  ProfileModel.fromJson(await _profileProvider.read<ProfileModel>(await PreferencesProvider.getUID()));
      _controller.add(ProfileStatus.read);
    });
    return _profile;
  }

  update(ProfileModel model) async {
    _lock.synchronized(() async {
      await _profileProvider.write<ProfileModel>(model);
      _controller.add(ProfileStatus.updated);
    });
  }

  delete(ProfileModel model) async {
    _lock.synchronized(() async {
      await _profileProvider.delete(model);
      _controller.add(ProfileStatus.deleted);
    });
  }

  Future<ProfileModel> create(ProfileModel model) async {
    var _result;
    _lock.synchronized(() async {
      _result = await _profileProvider.write<ProfileModel>(model);
      _controller.add(ProfileStatus.created);
    });
    return _result;
  }

  void dispose() => _controller.close();
}