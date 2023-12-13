import 'package:basic/data/models/profile_model.dart';
import 'package:basic/data/provider.dart';

class ProfileProvider extends Provider<ProfileModel> {
  ProfileProvider() : super('profile');

  @override
  ProfileModel fromJson(Map<String, dynamic> json) =>
      ProfileModel.fromJson(json);
  read<ProfileModel>(String? id) async {
    Map<String, dynamic> profile;
    try {
      profile = await super.read<ProfileModel>(id);
    } catch (e) {
      profile = <String, dynamic>{
        'id': id,
        'registeredAt': DateTime.now().toIso8601String(),
        'firstName': "First Name",
        'lastName': "Last Name",
        'nickName': "Nick Name",
        'photo': "Photo",
        'email': "Email",
        'phone': "Phone",
        'location': "Location",
        'user': "User",
      };
    }
    return profile;
  }
}
