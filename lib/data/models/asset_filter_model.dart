import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'asset_filter_model.g.dart';

@JsonSerializable()
class AssetFilterModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final String filter;

  const AssetFilterModel(this.id, this.name, this.description, this.filter);

  static const AssetFilterModel ALL = AssetFilterModel(
      'all', 'Всесборки', 'Сборники книг', 'select * from assets');

  factory AssetFilterModel.fromJson(Map<String, dynamic> json) =>
      _$AssetFilterModelFromJson(json);
  Map<String, dynamic> toJson() => _$AssetFilterModelToJson(this);

  @override
  List<Object?> get props => [id, name, description, filter];
}
