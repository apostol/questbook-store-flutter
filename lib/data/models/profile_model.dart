import 'package:basic/data/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel extends Model {
  final String registeredAt; // Would normally be of type DateTime
  final String firstName;
  final String lastName;
  final String nickName;
  final String photo;
  final String email;
  final String phone;
  final String location;
  final String user;

  const ProfileModel(id, this.user, this.registeredAt, this.firstName, this.lastName, this.nickName, this.photo, this.email, this.phone, this.location):super(id);

  static const ProfileModel empty = ProfileModel('0', '', '','', '', '', '', '', '', '');
  factory ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

  @override
  List<Object> get props => [id, user, email, firstName, lastName, nickName, location, phone];
}
