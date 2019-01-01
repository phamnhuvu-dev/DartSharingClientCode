class Task {
  int id;
  String title;
  String description;


  Task({this.id, this.title, this.description});

  Task.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        description = json["description"];
}
