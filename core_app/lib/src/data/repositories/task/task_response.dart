import 'package:core_app/src/data/models/task.dart';

class TaskResponse {
  final String message;
  final List<Task> tasks;
  final List<int> deletedIDs;
  final List<int> errorIDs;

  TaskResponse({
    this.message,
    this.tasks,
    this.deletedIDs,
    this.errorIDs,
  });
}
