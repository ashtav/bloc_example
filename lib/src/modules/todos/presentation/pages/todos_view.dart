import 'package:bloc_example/src/modules/todos/presentation/cubit/todos_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazyui/lazyui.dart';

class TodosView extends StatelessWidget {
  const TodosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        actions: [
          const Icon(Ti.user).onPressed(() {
            context.read<TodosCubit>().generateName();
          })
        ],
      ),
      body: BlocBuilder<TodosCubit, TodosState>(builder: (context, state) {
        if (state.isLoading) {
          return LzLoader.bar(message: 'Loading...');
        }

        final todos = state.todos;

        if (todos.isEmpty) {
          return const LzNoData(message: 'No data found');
        }

        return Refreshtor(
          onRefresh: () async => context.read<TodosCubit>().getTodos(),
          child: LzListView(
            padding: Ei.zero,
            children: todos.generate((item, i) {
              bool isCompleted = item.completed ?? false;

              return InkTouch(
                onTap: () {
                  context.read<TodosCubit>().mark(item.id!);
                },
                padding: Ei.all(20),
                border: Br.only(['t'], except: i == 0),
                child: Row(
                  mainAxisAlignment: Maa.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                            color:
                                isCompleted ? Colors.green : Colors.transparent,
                            border: isCompleted ? null : Border.all(),
                            borderRadius: Br.radius(15),
                          ),
                          margin: Ei.only(r: 20),
                        ),
                        Text('${item.todo}').flexible(),
                      ],
                    ).flexible(),
                    Iconr(Ti.x, padding: Ei.all(13), color: Colors.black45, margin: Ei.only(l: 20)).onTap(() {
                      LzConfirm(
                          title: 'Delete Todo',
                          message: 'Are you sure want to delete this todo?',
                          onConfirm: () {
                            context.read<TodosCubit>().remove(item.id!);
                          }).show(context);
                    })
                  ],
                ),
              );
            }),
          ),
        );
      }),
      bottomNavigationBar: BlocBuilder<TodosCubit, TodosState>(
        builder: (context, state) => Container(
            padding: Ei.all(20), color: Colors.white, child: Textr(state.name, icon: Ti.userCheck)),
      ),
    );
  }
}
