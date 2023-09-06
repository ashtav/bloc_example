import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazyui/lazyui.dart';

import '../cubit/users_cubit.dart';
import '../cubit/users_state.dart';
import '../data/models/user.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    // final usersCubit = BlocProvider.of<UsersCubit>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Users'),
          actions: [
            const Icon(Ti.plus).onPressed(() {
              final newUser = User(
                  id: DateTime.now().millisecondsSinceEpoch,
                  name: Faker.name(),
                  gender: "Female",
                  email: Faker.email());

              context.read<UsersCubit>().addData(newUser);
            })
          ],
        ),
        body: BlocBuilder<UsersCubit, UsersState>(builder: (context, state) {
          final users = state.users;

          if (state.isLoading) {
            return LzLoader.bar(message: 'Loading...');
          }

          if (users.isEmpty) {
            return const LzNoData(message: 'No data found');
          }

          return Refreshtor(
            onRefresh: () => context.read<UsersCubit>().getData(),
            child: LzListView(
              children: users.generate((item, i) {
                final key = GlobalKey();

                return InkTouch(
                  onTap: () {
                    DropX.show(key,
                        options: ['Edit', 'Delete'].options(options: {
                          1: ['Confirm', 'Cancel']
                              .options(pops: [1], dangers: [0])
                        }), onSelect: (state) {
                      if (state.option == 'Confirm') {
                        context.read<UsersCubit>().deleteData(item.id!);
                      }
                    });
                  },
                  padding: Ei.all(20),
                  border: Br.only(['t'], except: i == 0),
                  child: Row(
                    mainAxisAlignment: Maa.spaceBetween,
                    children: [
                      Columnize(
                        children: [
                          Text('${item.name}'),
                          Text('${item.email}', style: Gfont.muted),
                        ],
                      ).flexible(),
                      Icon(
                        Ti.dotsVertical,
                        color: Colors.black45,
                        key: key,
                      )
                    ],
                  ),
                );
              }),
            ),
          );
        }));
  }
}
