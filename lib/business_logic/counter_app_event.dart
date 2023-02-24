part of 'counter_app_bloc.dart';

@immutable
abstract class CounterAppEvent {}

class IncrementEvent extends CounterAppEvent {}

class DecrementEvent extends CounterAppEvent {}

class ResetEvent extends CounterAppEvent {}

class CounterInitializationDoneEvent extends CounterAppEvent {}
