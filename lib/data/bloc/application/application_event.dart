part of 'application_bloc.dart';

abstract class ApplicationEvent extends Equatable {
  const ApplicationEvent();

  @override
  List<Object> get props => [];
}

class ApplicationIntroEvent extends ApplicationEvent {
  const ApplicationIntroEvent(this.show);
  final bool show;

  @override
  List<Object> get props => [show];
}
