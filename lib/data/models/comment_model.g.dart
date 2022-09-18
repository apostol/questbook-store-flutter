// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return CommentModel(
    id: json['id'] as String,
    user: json['user'] as String,
    userName: json['userName'] as String,
    content: json['content'] as String,
  );
}

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'userName': instance.userName,
      'content': instance.content,
    };
