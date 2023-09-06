import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/users_cubit.dart';
import 'users_view.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UsersCubit(),
      child: const UsersView(),
    );
  }
}
