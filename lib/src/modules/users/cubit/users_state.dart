import 'package:equatable/equatable.dart';

import '../data/models/user.dart';

class UsersState extends Equatable { 
  final List<User> users;
  final bool isLoading;

  const UsersState({required this.users, this.isLoading = false});

  @override
  List<Object?> get props => [users, isLoading];

  UsersState copyWith({
    List<User>? users,
    bool? isLoading,
  }) {
    return UsersState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
