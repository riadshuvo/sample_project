
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(0),
      child: CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Counter')),
          body: Center(
            child: Text('${state.counterValue}', style: textTheme.headline2),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                key: const Key('counterView_increment_floatingActionButton'),
                child: const Icon(Icons.add),
                onPressed: () => context.read<CounterCubit>().increment(state.counterValue),
              ),
              const SizedBox(height: 8),
              FloatingActionButton(
                key: const Key('counterView_decrement_floatingActionButton'),
                child: const Icon(Icons.remove),
                onPressed: () => context.read<CounterCubit>().decrement(state.counterValue),
              ),
            ],
          ),
        );
      }
    );
  }
}
