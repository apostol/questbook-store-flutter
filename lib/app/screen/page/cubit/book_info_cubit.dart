import 'package:basic/data/models/book_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/src/widgets/framework.dart';

class BookInfoCubit extends Cubit<int> {
  /// {@macro counter_cubit}
  BookInfoCubit(BuildContext buildContext, BookModel book) : super(0);

  /// Add 1 to the current state.
  void increment() => emit(state + 1);

  /// Subtract 1 from the current state.
  void decrement() => emit(state - 1);

}