import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'artwork_filter_model.g.dart';

@JsonSerializable()
class ArtworkFilterModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String filter;

  const ArtworkFilterModel(this.id, this.name, this.description, this.filter);

  static const ArtworkFilterModel ALL = ArtworkFilterModel(
      'all',
      'Все иллюстрации',
      'Сборник иллюстраций к книгам',
      'select * from artworks');

  factory ArtworkFilterModel.fromJson(Map<String, dynamic> json) =>
      _$ArtworkFilterModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArtworkFilterModelToJson(this);

  @override
  List<Object?> get props => [id, name, description, filter];
}
