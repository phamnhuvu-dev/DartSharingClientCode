import 'dart:convert';

import 'package:core_app/src/data/models/task.dart';
import 'package:core_app/src/data/repositories/task/task_api_service.dart';
import 'package:core_app/src/data/repositories/task/task_repository.dart';
import 'package:core_app/src/modules/api_service.dart';
import 'package:http/http.dart';

class TaskRepositoryService extends TaskRepository {
  final TaskApiService apiService;

  TaskRepositoryService(this.apiService);

  @override
  Future<List<Task>> get(Map<String, dynamic> by) async {
    final int page = by["page"];
    final Response response = await apiService.getTasks(
        url: "$TASK_URL?page=$page", headers: appHeaders);

    Map json = jsonDecode(response.body);
    print(json);

    if (json.containsKey("tasks")) {
      Iterable jsonTasks = json["tasks"];
      List<Task> tasks =
          jsonTasks.map((model) => Task.fromJson(model)).toList();
      return tasks;
    } else {
      return List();
    }
  }

  @override
  Future<Task> insert(Task item) async {
    final Response response = await apiService.createTask(
      headers: appHeaders,
      title: item.title,
      description: item.description,
    );

    Map json = jsonDecode(response.body);

    return Task.fromJson(json["task"]);
  }

  @override
  Future<String> update(Task item) {
    // TODO: implement update
    return null;
  }

  @override
  Future<List<String>> delete({List<Task> items}) {
    // TODO: implement delete
    return null;
  }
}
