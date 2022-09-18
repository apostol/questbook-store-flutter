

import 'package:bloc/bloc.dart';

/// {@template application_observer}
/// [BlocObserver] for the application which
/// observes all [Cubit] state changes.
/// {@endtemplate}
class ApplicationObserver extends BlocObserver {
  @override
  void onChange(BlocBase cubit, Change change) {
    print('Change: ${cubit.runtimeType} $change');
    super.onChange(cubit, change);
  }

  @override
  void onError(BlocBase cubit, Object error, StackTrace stackTrace) {
    print('Error: ${cubit.runtimeType} $error');
    super.onError(cubit, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('Error: ${bloc.runtimeType} $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    print('Event: ${bloc.runtimeType} $event');
    super.onEvent(bloc, event);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) {
    print('noSuchMethod: ${invocation.runtimeType}');
    super.noSuchMethod(invocation);
  }
}