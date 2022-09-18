import 'dart:async';
import 'package:async/async.dart';
import 'package:basic/data/models/user_model.dart';
import 'package:flutter_login_vk/flutter_login_vk.dart';

enum AuthenticationStatus { authenticated, changed, unauthenticated, unknown }

class AuthenticationRepository {

  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  AuthenticationRepository()
  {
    init();
  }

  Future<Result<bool>> init() async {
    _controller.add(AuthenticationStatus.authenticated);
    return Future.value(Result.value(true));
  }

  Future<bool> isLogged() async => true;

  Future<VKAccessToken?> logIn() async {
    return VKAccessToken.fromMap(<String, dynamic>{
      'token': "token",
      'userId': "userId",
      'expiresIn': 86400,
      'created': DateTime.now().millisecondsSinceEpoch,
      'secret': "secret",
      'email': "email",
      'httpsRequired': false
    });
  }

  logOut() async {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<String?> getEmail() async => "test@email.com";

  Future<UserModel> get user async {
    return UserModel("user.id", "email@email.com", "first name", "user photo");
  }

  void dispose() => _controller.close();
}
