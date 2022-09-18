import 'package:bloc/bloc.dart';

class SettingsCubit extends Cubit<int> {
  /// {@macro counter_cubit}
  SettingsCubit() : super(0);

  /// Add 1 to the current state.
  void increment() => emit(state + 1);

  /// Subtract 1 from the current state.
  void decrement() => emit(state - 1);
}