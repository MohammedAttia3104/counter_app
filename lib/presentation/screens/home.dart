import 'package:counter_app/business_logic/counter_app_bloc.dart';
import 'package:counter_app/presentation/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocInstance = BlocProvider.of<CounterAppBloc>(
      context,
      listen: true,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CounterApp',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter Value\n',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              blocInstance.counterValue.toString(),
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MainButton(
                  textState: 'Minus',
                  onPressed: () {
                    blocInstance.add(DecrementEvent());
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                MainButton(
                  textState: 'Reset',
                  onPressed: () {
                    blocInstance.add(ResetEvent());
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                MainButton(
                  textState: 'Plus',
                  onPressed: () {
                    blocInstance.add(IncrementEvent());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
