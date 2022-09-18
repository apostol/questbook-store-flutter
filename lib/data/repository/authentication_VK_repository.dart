import 'dart:async';
import 'package:async/async.dart';
import 'package:basic/data/models/user_model.dart';
import 'package:basic/data/repository/authentication_repository.dart';
import 'package:flutter_login_vk/flutter_login_vk.dart';


class AuthenticationVKRepository extends AuthenticationRepository {

  final _controller = StreamController<AuthenticationStatus>();

  final VKLogin _vk;
  final _appId = '7883420';


  Stream<AuthenticationStatus> get status async* {
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  AuthenticationVKRepository() : _vk = VKLogin()
  {
    init();
  }

  Future<Result<bool>> init() async {
    var result = await _vk.initSdk(_appId);
    var isLogged = await _vk.isLoggedIn;
    if (isLogged)
      _controller.add(AuthenticationStatus.authenticated);
    return result;
  }

  Future<bool> isLogged() async => await _vk.isLoggedIn;

  Future<VKAccessToken?> logIn() async {
    var isLogged = await _vk.isLoggedIn;
    if (!isLogged) {
      var res = await _vk.logIn(scope: [
        VKScope.email,
        VKScope.friends,
      ]);
      // Проверяем результат
      if (res.isValue) {
        // Ошибки нет, но мы еще не знаем, вошел
        // пользователь или нет, он мог отменить вход.
        // Нужно проверить свойство isCanceled:
        final VKLoginResult data = res.asValue!.value;
        if (data.isCanceled) {
          // Пользователь отменил вход
          _controller.add(AuthenticationStatus.unauthenticated);
          return null;
        }
      } else {
        // Ошибка входа
        final errorRes = res.asError;
        print('Ошибка при входе: ${errorRes!.error}');
        _controller.add(AuthenticationStatus.unauthenticated);
        return null;
      }
    }

    // Вход выполнен ?
    // Отправьте этот access token на сервер для валидации
    // и авторизации в вашем приложении
    final VKAccessToken? accessToken = await _vk.accessToken;
    print('Access token: ${accessToken!.token}');

    // Получаем данные профиля
    final _profile = await _vk.getUserProfile();
    final profile = _profile.asValue!.value;
    print('Добро пожаловать, ${profile!.firstName}! Ваш ID: ${accessToken.userId}');

    // Получаем email. Выше, при логине, мы запросили права,
    // поэтому можем прочитать электронную почту пользователя
    final email = accessToken.email;
    print('Ваш email: $email');
    _controller.add(AuthenticationStatus.authenticated);
    return accessToken ;
  }

  logOut() async {
    await _vk.logOut();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<String?> getEmail() async => await _vk.getUserEmail();

  Future<UserModel> get user async {
    Result<VKUserProfile?> _user = await _vk.getUserProfile();
    var user = _user.asValue?.value;
    var _email = await getEmail();
    return UserModel(user!.userId.toString(), _email, user.firstName, user.photo50);
  }

  void dispose() => _controller.close();
}
