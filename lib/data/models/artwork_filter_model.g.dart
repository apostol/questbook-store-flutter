// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtworkFilterModel _$ArtworkFilterModelFromJson(Map<String, dynamic> json) {
  return ArtworkFilterModel(
    json['id'] as String,
    json['name'] as String,
    json['description'] as String,
    json['filter'] as String,
  );
}

Map<String, dynamic> _$ArtworkFilterModelToJson(ArtworkFilterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'filter': instance.filter,
    };
