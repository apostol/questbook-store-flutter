import 'package:basic/data/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application_model.g.dart';

@JsonSerializable()
class ApplicationModel extends Model {
  final bool intro;

  const ApplicationModel(id, this.intro):super(id);

  static const ApplicationModel empty = ApplicationModel('application', false);
  factory ApplicationModel.fromJson(Map<String, dynamic> json) => _$ApplicationModelFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationModelToJson(this);

  @override
  List<Object> get props => [id, intro];
}
