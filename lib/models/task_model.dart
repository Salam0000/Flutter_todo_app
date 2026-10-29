// {"title":"learn flutter","description":"build app","isDone":false}
// Map<String ,dynamic>
class TaskModel {
  String title;
  String description;
  bool isDone;

  TaskModel({
    required this.title,
    required this.description,
    required this.isDone,
  });

  Map<String, dynamic> toJSON() => {
        // key is case sensitive
        "title": title,
        "description": description,
        "isDone": isDone,
      };

  factory TaskModel.fromJSON(Map<String, dynamic> json) => TaskModel(
      title: json["title"] as String,
      description: json["description"] as String,
      isDone: json["isDone"] ?? false as bool);
}
