import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvc/model/todo.dart';

class TodosNotifier extends StateNotifier<List<Todo>> {
  TodosNotifier() : super([]);

  void addTodo(Todo todo) {
    state = [...state, todo];
  }

  void removeTodo(int todoId) {
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo
    ];
  }

  void toggle(int todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId) todo.copyWith(isCompleted: !todo.isCompleted) else todo,
    ];
  }
}
