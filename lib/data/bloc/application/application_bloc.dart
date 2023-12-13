import 'package:basic/data/models/application_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'application_event.dart';
part 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationModel> {

  ApplicationBloc(BuildContext context) :
    super(ApplicationModel.empty);

}