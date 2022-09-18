// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetFilterModel _$AssetFilterModelFromJson(Map<String, dynamic> json) {
  return AssetFilterModel(
    json['id'] as String,
    json['name'] as String,
    json['description'] as String,
    json['filter'] as String,
  );
}

Map<String, dynamic> _$AssetFilterModelToJson(AssetFilterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'filter': instance.filter,
    };
