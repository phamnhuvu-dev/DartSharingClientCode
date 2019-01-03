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
    final int page = by[PAGE_KEY];
    final Response response = await apiService.getTasks(
      url: "$TASK_URL?$PAGE_KEY=$page", headers: appHeaders,);

    Map json = jsonDecode(response.body);
    print(json);

    if (json.containsKey(TASKS_KEY)) {
      Iterable jsonTasks = json[TASKS_KEY];
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

    return Task.fromJson(json[TASK_KEY]);
  }

  @override
  Future<Map<String, dynamic>> delete({List<Task> items}) async {
    final taskIDs = items.map((task) => task.id).toList();
    final jsonTaskIDs = jsonEncode(taskIDs);

    final Response response = await apiService.deleteTask(
      url: "$TASK_URL?$TASK_IDS_KEY=$jsonTaskIDs",
      headers: appHeaders,
    );

    Map json = jsonDecode(response.body);
    print(json);

    if (json[MESSAGE_KEY] == SUCCESS_KEY) {
      return {
        DELETED_IDS_KEY: json[DELETED_IDS_KEY],
      };
    } else if (json[MESSAGE_KEY] == UNSUCCESS_KEY) {
      return {
        ERRORS_IDS_KEY: json[ERRORS_IDS_KEY],
        DELETED_IDS_KEY: json[DELETED_IDS_KEY],
      };
    } else {
      return null;
    }
  }

  @override
  Future<Map<String, dynamic>> update(Task item) async {
    return null;
  }
}
