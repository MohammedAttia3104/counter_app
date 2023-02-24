part of 'counter_app_bloc.dart';

@immutable
abstract class CounterAppState {}

class CounterAppInitial extends CounterAppState {}

class CounterInitializationDoneState extends CounterAppState {}

class CounterChangedState extends CounterAppState {}
