import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_app_event.dart';
part 'counter_app_state.dart';

class CounterAppBloc extends Bloc<CounterAppEvent, CounterAppState> {
  int counter = 0;

  CounterAppBloc() : super(CounterAppInitial()) {
    on<CounterAppEvent>((event, emit) {
      if (event is IncrementEvent) {
        counter++;
        emit(
          CounterChangedState(
            counter: counter,
          ),
        );
      } else if (event is DecrementEvent) {
        counter--;
        emit(
          CounterChangedState(
            counter: counter,
          ),
        );
      } else {
        counter = 0;
        emit(
          CounterChangedState(
            counter: counter,
          ),
        );
      }
    });
  }
}
