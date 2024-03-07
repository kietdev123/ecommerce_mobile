import 'dart:ffi';

import 'package:ecommerce_mobile/bloc/counter/counter_event.dart';
import 'package:ecommerce_mobile/bloc/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  //Counter repo instance
  //final _CounterRepo = CounterRepoImp();
  int value = 0;
  CounterBloc() : super(CounterInitial(0)) {
    on<CounterIncreaceEvent>((event, emit) {
      _increaseValue(event, emit);
    });
  }

  Future<void> _increaseValue(
      CounterEvent event, Emitter<CounterState> emit) async {
    if (event is CounterIncreaceEvent) {
      value++;
      emit(CounterInitial(value));
    }
  }
}
