class Todo {
  final int id;
  final String name;
  final String description;
  final bool isCompleted;

  Todo({required this.id, required this.name, required this.description, required this.isCompleted});

  Todo copyWith({int? id, String? name, String? description, bool? isCompleted}) {
    return Todo(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
