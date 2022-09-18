import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contest_filter_model.g.dart';

@JsonSerializable()
class ContestFilterModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String filter;

  const ContestFilterModel(this.id, this.name, this.description, this.filter);

  static const ContestFilterModel ALL = ContestFilterModel(
      'all', 'Все конкурсы', 'Сборник конкурсов', 'select * from contests');

  factory ContestFilterModel.fromJson(Map<String, dynamic> json) =>
      _$ContestFilterModelFromJson(json);
  Map<String, dynamic> toJson() => _$ContestFilterModelToJson(this);

  @override
  List<Object?> get props => [id, name, description, filter];
}
