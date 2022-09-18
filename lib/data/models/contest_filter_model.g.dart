// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contest_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContestFilterModel _$ContestFilterModelFromJson(Map<String, dynamic> json) {
  return ContestFilterModel(
    json['id'] as String,
    json['name'] as String,
    json['description'] as String,
    json['filter'] as String,
  );
}

Map<String, dynamic> _$ContestFilterModelToJson(ContestFilterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'filter': instance.filter,
    };
