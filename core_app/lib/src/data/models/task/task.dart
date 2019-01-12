class Task {
  int id;
  String title;
  String description;
  bool isDeleteSelect = false;


  Task({this.id, this.title, this.description});

  Task.fromJson(Map<String, dynamic> json)
      : id = json["task_id"],
        title = json["title"],
        description = json["description"];
}
