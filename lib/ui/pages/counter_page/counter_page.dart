import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot/data/bloc/counter_cubit/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  CounterPage({Key? key}) : super(key: key);
  static const String routeName = "/counterPage";
  CounterCubit cubit = CounterCubit();

  @override
  Widget build(BuildContext buildContext) {
    final textTheme = Theme.of(buildContext).textTheme;
    return BlocProvider(
      create: (BuildContext context) => cubit,
      child: Scaffold(
        appBar: AppBar(title: const Text('Counter')),
        body: Center(
          child: BlocBuilder<CounterCubit, int>(

            builder: (context, state) {
              return Text('$state', style: textTheme.headline2);
            },
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              key: const Key('counterView_increment_floatingActionButton'),
              child: const Icon(Icons.add),
              onPressed: () => cubit.increment(),
            ),
            const SizedBox(height: 8),
            FloatingActionButton(
              key: const Key('counterView_decrement_floatingActionButton'),
              child: const Icon(Icons.remove),
              onPressed: () => cubit.decrement(),
            ),
          ],
        ),
      ),
    );
  }
}
