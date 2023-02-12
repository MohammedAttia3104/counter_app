part of 'counter_app_bloc.dart';

@immutable
abstract class CounterAppState {}

class CounterAppInitial extends CounterAppState {}

class CounterChangedState extends CounterAppState {
  final int counter;

  CounterChangedState({required this.counter});
}
