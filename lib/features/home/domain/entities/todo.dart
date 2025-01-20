class Todo {
  String? id;
  String image;
  String title;
  String desc;
  String priority;
  String status;
  String? user;
  String? createdAt;
  String? updatedAt;
  Todo({
    this.id,
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.status,
    this.user,
    this.createdAt,
    this.updatedAt,
  });
}
