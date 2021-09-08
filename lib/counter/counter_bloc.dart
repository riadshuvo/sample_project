
import 'dart:math';

import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit(initialState) : super(CounterState(counterValue: 0));

  void increment(int value) => emit(state.copyWith(counterValue: value + 1) );

  void decrement(int value) => emit(state.copyWith(counterValue: value - 1));
}

class CounterState{
  CounterState({required this.counterValue});
  final int counterValue;

  CounterState copyWith({
    required int counterValue
  }) {
    return CounterState(
      counterValue: counterValue,
    );
  }
}