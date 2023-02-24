import 'package:counter_app/data/repository/repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_app_event.dart';

part 'counter_app_state.dart';

class CounterAppBloc extends Bloc<CounterAppEvent, CounterAppState> {
  int counterValue;
  final Repository repo;

  CounterAppBloc(this.repo)
      : counterValue = repo.getCounterValue(),
        super(CounterAppInitial()) {
    on<CounterAppEvent>((
      event,
      emit,
    ) async {
      counterValue = repo.getCounterValue();
      if (event is IncrementEvent) {
        counterValue = await repo.incrementCounter();
        //counterValue++;
        emit(
          CounterChangedState(),
        );
      } else if (event is DecrementEvent) {
        counterValue = await repo.decrementCounter();
        //counterValue--;
        emit(
          CounterChangedState(),
        );
      }
    });
  }
}
