import 'package:counter_app/business_logic/counter_app_bloc.dart';
import 'package:counter_app/data/cache_helper/cache_helper.dart';
import 'package:counter_app/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc_observer.dart' as bo;
import 'data/repository/repo.dart';

late final SharedPreferences _sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _sharedPreferences = await SharedPreferences.getInstance();
  Bloc.observer = const bo.AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterAppBloc(
        Repository(DataSource(_sharedPreferences)),
      ),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
