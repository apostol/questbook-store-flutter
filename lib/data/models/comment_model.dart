import 'package:json_annotation/json_annotation.dart';

import '../model.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel extends Model {
  final String id;
  final String user;
  final String userName;
  final String content;

  const CommentModel(
      {required this.id,
      required this.user,
      required this.userName,
      required this.content})
      : super(id);

  static const CommentModel empty =
      CommentModel(id: '0', user: '', userName: '', content: '');
  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentModelToJson(this);

  @override
  List<Object> get props => [id, user, userName, content];
}
