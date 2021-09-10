
import 'dart:math';

import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit(initialState) : super(
      CounterState(counterValue: 0));

  void increment(int value) => emit(state.copyWith(counterValue: value + 1) );

  void decrement(int value) => emit(state.copyWith(counterValue: max(0, value - 1)));
}

class PreviousCounterCubit extends Cubit<PreviousCounterState>{
  PreviousCounterCubit(initialState) : super(
      PreviousCounterState(previousCounterValue: 0));

  void incrementPreviousValue(int value) =>
      emit(state.copyWith(previousCounterValue: value + 1) );
}

class CounterState{
  CounterState({this.counterValue});
  final int? counterValue;

  CounterState copyWith({
    int? counterValue,
  }) {
    return CounterState(
      counterValue: counterValue ?? this.counterValue,
    );
  }
}

class PreviousCounterState{
  PreviousCounterState({this.previousCounterValue});
  int? previousCounterValue = 0;

  PreviousCounterState copyWith({
    int? previousCounterValue
  }) {
    return PreviousCounterState(
      previousCounterValue: previousCounterValue ?? this.previousCounterValue
    );
  }
}