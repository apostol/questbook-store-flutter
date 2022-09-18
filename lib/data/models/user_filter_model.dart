import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_filter_model.g.dart';

@JsonSerializable()
class UserFilterModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String filter;

  const UserFilterModel(this.id, this.name, this.description, this.filter);

  static const UserFilterModel ALL = UserFilterModel('all', 'Все пользователи',
      'Все пользователи в системе', 'select * from users');

  static const UserFilterModel AUTHOR_TOP = UserFilterModel(
      'author_top',
      'Лучшие авторы',
      'Авторы, количество чтений которых наибольшее',
      'select * from users where author is true and author_readed>0 ORDER DESC author_readed');

  static const UserFilterModel USER_TOP = UserFilterModel(
      'user_top',
      'Лучшие читатели',
      'Читатели, которые прочитали много книг',
      'select * from users where author is false and user_readed>0 ORDER DESC user_readed');

  factory UserFilterModel.fromJson(Map<String, dynamic> json) =>
      _$UserFilterModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserFilterModelToJson(this);

  @override
  List<Object?> get props => [id, name, description, filter];
}
