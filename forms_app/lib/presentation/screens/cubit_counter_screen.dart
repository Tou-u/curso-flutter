import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:forms_app/presentation/presentation.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterCubit>().state;
    final setCounterState = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Counter: ${counterState.transactionCount}'),
        actions: [
          IconButton(
            onPressed: () {
              setCounterState.reset();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Text('Counter value: ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        spacing: 10,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+3'),
            onPressed: () {
              setCounterState.increaseBy(3);
            },
          ),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () {
              setCounterState.increaseBy(2);
            },
          ),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () {
              setCounterState.increaseBy(1);
            },
          ),
        ],
      ),
    );
  }
}
