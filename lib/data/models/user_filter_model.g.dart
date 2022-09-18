// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFilterModel _$UserFilterModelFromJson(Map<String, dynamic> json) {
  return UserFilterModel(
    json['id'] as String,
    json['name'] as String,
    json['description'] as String,
    json['filter'] as String,
  );
}

Map<String, dynamic> _$UserFilterModelToJson(UserFilterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'filter': instance.filter,
    };
