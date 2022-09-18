import 'package:basic/data/bloc/profile/profile_bloc.dart';
import 'package:basic/data/models/profile_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfilePageState> {
  final ProfileBloc _bloc;

  ProfileCubit(BuildContext context):
        _bloc = BlocProvider.of<ProfileBloc>(context),
        super(const ProfilePageState());

  void fetchProfile(){
    emit(state.fromModel(model: _bloc.state.profile));
  }

  void photoChanged(String value) {
    final photo = value;
    emit(state.copyWith(photo: photo));
  }

  @override
  close() async {
    super.close();
    _bloc.close();
  }
}

class ProfilePageState extends Equatable {
  const ProfilePageState({
    this.email = '',
    this.nickName = '',
    this.mobile = '',
    this.photo = ''
  });

  final String nickName;
  final String email;
  final String mobile;
  final String photo;

  @override
  List<Object> get props => [email, nickName, mobile, photo];

  ProfilePageState fromModel({
    ProfileModel? model
  }){
     return  ProfilePageState(
       nickName: model!.nickName,
       email: model.email,
       mobile: model.phone,
       photo: model.photo
     );
  }

  ProfileModel toModel(ProfileModel _model){
    return ProfileModel(
      _model.id,
      _model.user,
      _model.registeredAt,
      '',
      '',
      nickName,
      photo,
      email,
      mobile,
      ''
    );
  }

  ProfilePageState copyWith({
    String? email,
    String? nickName,
    String? mobile,
    String? photo
  }) {
    return ProfilePageState(
      email: email ?? this.email,
      nickName: nickName ?? this.nickName,
      mobile: mobile ?? this.mobile,
      photo: photo ?? this.photo
    );
  }
}