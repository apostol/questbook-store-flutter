import 'package:basic/data/models/contest_filter_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContestFilterCubit extends Cubit<int> {
  final ContestFilterModel filter;

  /// {@macro counter_cubit}
  ContestFilterCubit(BuildContext buildContext, this.filter) : super(0);

  /// Add 1 to the current state.
  void increment() => emit(state + 1);

  /// Subtract 1 from the current state.
  void decrement() => emit(state - 1);
}
