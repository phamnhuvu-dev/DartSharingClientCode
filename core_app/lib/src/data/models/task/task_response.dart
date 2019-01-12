import 'package:core_app/src/data/models/task/task.dart';

class TaskResponse {
  final String message;
  final List<Task> tasks;
  final List<int> successIDs;
  final List<int> errorIDs;

  TaskResponse({
    this.message,
    this.tasks,
    this.successIDs,
    this.errorIDs,
  });
}
