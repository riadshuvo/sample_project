
import 'dart:math';

import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int>{
  CounterCubit(initialState) : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(max(0, state - 1));
}