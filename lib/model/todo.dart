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

  factory Todo.fromFirestore(Map<String, dynamic> data) {
    return Todo(
      title: data['title'] ?? '',
      uid: data['uid'] ?? '',
      description: data['description'] ?? '',
      isComplete: data['isComplete'] ?? false,
    );
  }
}
