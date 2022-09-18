part of 'application_bloc.dart';

enum ApplicationStateStatus {
  start,
  authorized,
  pause,
  stop
}

abstract class ApplicationState {
  ApplicationStateStatus get status;
}

class ApplicationInitial extends ApplicationState {
  @override
  ApplicationStateStatus get status => ApplicationStateStatus.start;
}

class ApplicationAuthorized extends ApplicationState {
  @override
  ApplicationStateStatus get status => ApplicationStateStatus.authorized;
}
