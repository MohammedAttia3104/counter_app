import 'package:counter_app/data/cache_helper/cache_helper.dart';
import 'package:counter_app/data/repository/repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'counter_app_event.dart';
part 'counter_app_state.dart';

class CounterAppBloc extends Bloc<CounterAppEvent, CounterAppState> {
  static int counterValue = 0;

  CounterAppBloc() : super(CounterAppInitial()) {
    on<CounterAppEvent>((event, emit)async {
      Repository? repo;
      counterValue = repo?.getCounterValue() ?? 0;
      if (event is IncrementEvent) {
        counterValue = await repo?.incrementCounter() ?? 0;
        //counterValue++;
        emit(
          CounterChangedState(
            counter: counterValue,
          ),
        );
      } else if (event is DecrementEvent) {
        counterValue = await repo?.decrementCounter() ?? 0;
        //counterValue--;
        emit(
          CounterChangedState(
            counter: counterValue,
          ),
        );
      } else {
        counterValue = 0;
        emit(
          CounterChangedState(
            counter: counterValue,
          ),
        );
      }
    });
  }
}
