import 'package:fetchly/fetchly.dart';

class TodoDataSource extends Fetchly {
  Future<ResHandler> getTodos() async => await get('todos');
}