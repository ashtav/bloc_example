class Todo {
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  Todo({this.id, this.todo, this.completed, this.userId});

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'] as int?,
        todo: json['todo'] as String?,
        completed: json['completed'] as bool?,
        userId: json['userId'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'todo': todo,
        'completed': completed,
        'userId': userId,
      };
}
