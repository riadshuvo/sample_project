import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(0),
      child: BlocProvider(
        create: (_) => PreviousCounterCubit(0),
        child: CounterView(),
      ),
    );
  }
}

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocBuilder<PreviousCounterCubit, PreviousCounterState>(
      builder: (context, previousState) {
        return BlocListener<CounterCubit, CounterState>(
          listenWhen: (context, counterState) {
            if (counterState.counterValue! > 5) {
              /// If return true then will call the Listener
              return true;
            } else {
              return false;
            }
          },
          listener: (context, counterState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('value: ${counterState.counterValue}')));

            /// If listenWhen return true then PreviousCounterCubit Bloc will be called
            context
                .read<PreviousCounterCubit>()
                .incrementPreviousValue(previousState.previousCounterValue!);
          },
          child: BlocBuilder<CounterCubit, CounterState>(
            builder: (context, counterState) {
              return Scaffold(
                appBar: AppBar(title: const Text('Counter')),
                body: Column(
                  children: [
                    counterBlocBuilder(textTheme),
                    SizedBox(
                      height: 10,
                    ),
                    previousCounterBlocBuilder(textTheme)
                  ],
                ),
                floatingActionButton: floatingButton(context, counterState),
              );
            },
          ),
        );
      },
    );
  }

  BlocBuilder<PreviousCounterCubit, PreviousCounterState>
      previousCounterBlocBuilder(TextTheme textTheme) {
    return BlocBuilder<PreviousCounterCubit, PreviousCounterState>(
        builder: (context, state) {
      return Center(
        child: Text('previous value: ${state.previousCounterValue}',
            style: textTheme.headline3),
      );
    });
  }

  BlocBuilder<CounterCubit, CounterState> counterBlocBuilder(
      TextTheme textTheme) {
    return BlocBuilder<CounterCubit, CounterState>(builder: (context, state) {
      return Center(
        child: Text('current value: ${state.counterValue}',
            style: textTheme.headline3),
      );
    });
  }

  Column floatingButton(BuildContext context, CounterState counterState) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        incrementActionButton(context, counterState),
        const SizedBox(height: 8),
        decrementActionButton(context, counterState),
      ],
    );
  }

  FloatingActionButton decrementActionButton(
      BuildContext context, CounterState counterState) {
    return FloatingActionButton(
      key: const Key('counterView_decrement_floatingActionButton'),
      child: const Icon(Icons.remove),
      onPressed: () =>
          context.read<CounterCubit>().decrement(counterState.counterValue!),
    );
  }

  FloatingActionButton incrementActionButton(
      BuildContext context, CounterState counterState) {
    return FloatingActionButton(
      key: const Key('counterView_increment_floatingActionButton'),
      child: const Icon(Icons.add),
      onPressed: () =>
          context.read<CounterCubit>().increment(counterState.counterValue!),
    );
  }
}
