import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterBloc>().state;
    final setCounterState = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Counter: ${counterState.transactionCount}'),
        actions: [
          IconButton(
            onPressed: () => setCounterState.add(CounterReset()),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Text('${counterState.counter}'),
      ),
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        spacing: 10,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+3'),
            onPressed: () => setCounterState.add(const CounterIncreased(3)),
          ),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () => setCounterState.add(const CounterIncreased(2)),
          ),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () => setCounterState.add(const CounterIncreased(1)),
          ),
        ],
      ),
    );
  }
}
