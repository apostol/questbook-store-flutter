import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final String? email;
  final String id;
  final String name;
  final String? photo;

  const UserModel(this.id,this.email,this.name,this.photo): assert(email != null);

  static const UserModel empty = UserModel('0', '', '', '');
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [email, id, name, photo];
}