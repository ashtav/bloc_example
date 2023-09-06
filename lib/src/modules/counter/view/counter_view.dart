import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazyui/lazyui.dart';

import '../cubit/counter_cubit.dart';

/// {@template counter_view}
/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
/// {@endtemplate}
class CounterView extends StatelessWidget {
  /// {@macro counter_view}
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text('$state', style: Gfont.fs(100).bold);
          },
        ),
      ),
      floatingActionButton: Column(
          mainAxisAlignment: Maa.end,
          crossAxisAlignment: Caa.end,
          children: [Ti.plus, Ti.minus].generate((item, i) {
            return FloatingActionButton(
              heroTag: 'tag-$i',
              child: Icon(item),
              onPressed: () {
                final cubit = context.read<CounterCubit>();
                i == 0 ? cubit.increment() : cubit.decrement();
              },
            ).margin(t: 10);
          })),
    );
  }
}
