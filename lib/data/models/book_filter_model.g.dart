// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookFilterModel _$BookFilterModelFromJson(Map<String, dynamic> json) {
  return BookFilterModel(
    json['id'] as String,
    json['name'] as String,
    json['description'] as String,
    json['filter'] as String,
  );
}

Map<String, dynamic> _$BookFilterModelToJson(BookFilterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'filter': instance.filter,
    };
