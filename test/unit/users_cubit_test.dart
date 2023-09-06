import 'package:bloc_example/src/modules/users/cubit/users_cubit.dart';
import 'package:bloc_example/src/modules/users/cubit/users_state.dart';
import 'package:bloc_example/src/modules/users/data/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UsersCubit', () {
    test('Initial state is correct', () {
      final cubit = UsersCubit();
      expect(cubit.state, const UsersState(users: <User>[], isLoading: true));
    });

    test('getData updates users list', () async {
      final cubit = UsersCubit();

      await cubit.getData();

      expect(cubit.state.isLoading, false);
      expect(cubit.state.users.length, 1);
      expect(cubit.state.users[0].name, "John Doe");

      cubit.close();
    });

    test('addData updates users list', () {
      final cubit = UsersCubit();
      const newUser = User(
          id: 2, name: "Jane Doe", gender: "Female", email: "janedoe@gmail.com");

      cubit.addData(newUser);
      expect(cubit.state.users.length, 1);

      cubit.close();
    });
  });
}
