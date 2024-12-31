class Todo {
  final String uid;
  final String title;
  final String description;
  final bool isComplete;

  Todo({
    required this.uid,
    required this.title,
    required this.description,
    required this.isComplete,
  });

  factory Todo.fromMap(String id, Map<String, dynamic> data) {
    return Todo(
      uid: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      isComplete: data['isComplete'] ?? false,
    );
  }
}
