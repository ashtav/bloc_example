import 'package:bloc_example/src/modules/todos/presentation/cubit/todos_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'todos_view.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosCubit(),
      child: const TodosView(),
    );
  }
}