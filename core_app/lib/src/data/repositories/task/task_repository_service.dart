import 'dart:convert';

import 'package:core_app/src/data/models/task.dart';
import 'package:core_app/src/data/repositories/task/task_api_service.dart';
import 'package:core_app/src/data/repositories/task/task_repository.dart';
import 'package:core_app/src/data/repositories/task/task_request.dart';
import 'package:core_app/src/data/repositories/task/task_response.dart';
import 'package:core_app/src/modules/api_service.dart';
import 'package:http/http.dart';

class TaskRepositoryService extends TaskRepository {
  final TaskApiService apiService;

  TaskRepositoryService(this.apiService);

  @override
  Future<TaskResponse> get(TaskRequest request) async {
    final Response response = await apiService.getTasks(
      url: "$TASK_URL?$PAGE_KEY=${request.page}",
      headers: appHeaders,
    );

    Map json = jsonDecode(response.body);
    print(json);
    if (json.containsKey(TASKS_KEY)) {
      Iterable jsonTasks = json[TASKS_KEY];
      List<Task> tasks =
          jsonTasks.map((model) => Task.fromJson(model)).toList();
      return TaskResponse(tasks: tasks);
    } else {
      return TaskResponse();
    }
  }

  @override
  Future<TaskResponse> insert(TaskRequest request) async {
    final Response response = await apiService.createTask(
      headers: appHeaders,
      title: request.tasks.first.title,
      description: request.tasks.first.description,
    );

    Map json = jsonDecode(response.body);

    return TaskResponse(tasks: [Task.fromJson(json[TASK_KEY])]);
  }

  @override
  Future<TaskResponse> update(TaskRequest request) {
    // TODO: implement update
    return null;
  }

  @override
  Future<TaskResponse> delete(TaskRequest request) async {
    final taskIDs = request.tasks.map((task) => task.id).toList();
    final jsonTaskIDs = jsonEncode(taskIDs);

    final Response response = await apiService.deleteTask(
      url: "$TASK_URL?$TASK_IDS_KEY=$jsonTaskIDs",
      headers: appHeaders,
    );

    Map json = jsonDecode(response.body);
    final deletedIDs = json[DELETED_IDS_KEY];
    final errorIDs = json[ERRORS_IDS_KEY];

    return TaskResponse(
      message: json[MESSAGE_KEY],
      deletedIDs: deletedIDs != null ? List<int>.from(deletedIDs) : [],
      errorIDs: errorIDs != null ? List<int>.from(errorIDs) : [],
    );
  }
}
