import 'package:lazyui/lazyui.dart';

import '../datasources/todo_datasource.dart';
import '../models/todo.dart';

class TodoRepository {
  static Future<List<Todo>> getTodos() async {
    try {
      final res = await TodoDataSource().getTodos();
      List data = res.body?['todos'] ?? [];
      return data.map((e) => Todo.fromJson(e)).toList();
    } catch (e, s) {
      Errors.check(e, s);
      return [];
    }
  }
}