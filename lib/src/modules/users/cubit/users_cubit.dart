import 'package:bloc/bloc.dart';
import 'package:lazyui/lazyui.dart';

import '../data/models/user.dart';
import 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(const UsersState(users: <User>[], isLoading: false)) {
    getData();
  }

  Future getData() async {
    try {
      emit(state.copyWith(isLoading: true));
      await Future.delayed(1.s);

      const newUser = User(
          id: 1, name: "John Doe", gender: "Male", email: "johndoe@gmail.com");
      List<User> users = [newUser];

      emit(UsersState(users: users));
    } catch (e, s) {
      Errors.check(e, s);
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void addData(User user) {
    final users = List<User>.from(state.users);
    users.add(user);

    emit(UsersState(users: users));
  }

  void deleteData(int id) {
    final users = List<User>.from(state.users);
    users.removeWhere((element) => element.id == id);

    emit(UsersState(users: users));
  }

  @override
  Future<void> close() {
    logg('UsersCubit closed');
    return super.close();
  }
}
