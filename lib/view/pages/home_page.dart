import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvc/provider/todo_notifier.dart';
import 'package:mvc/model/todo.dart';

final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todosProvider);
    return Scaffold(
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];
            return ListTile(
              onTap: () {
                ref.read(todosProvider.notifier).removeTodo(todo.id);
              },
              leading: Text('${todo.id}'),
              title: Text(todo.name),
              subtitle: Text(todo.description),
              trailing: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) {
                    ref.read(todosProvider.notifier).toggle(todo.id);
                  }),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newTodo = Todo(
            id: ref.read(todosProvider).length + 1,
            name: "Todo name",
            description: "description",
            isCompleted: false,
          );
          ref.read(todosProvider.notifier).addTodo(newTodo);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
