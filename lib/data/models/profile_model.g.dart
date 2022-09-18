// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return ProfileModel(
    json['id'],
    json['user'] as String,
    json['registeredAt'] as String,
    json['firstName'] as String,
    json['lastName'] as String,
    json['nickName'] as String,
    json['photo'] as String,
    json['email'] as String,
    json['phone'] as String,
    json['location'] as String,
  );
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'registeredAt': instance.registeredAt,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'nickName': instance.nickName,
      'photo': instance.photo,
      'email': instance.email,
      'phone': instance.phone,
      'location': instance.location,
      'user': instance.user,
    };
