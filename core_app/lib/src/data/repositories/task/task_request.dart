import 'package:core_app/src/data/models/task.dart';

class TaskRequest {
  final int page;
  final List<Task> tasks;

  TaskRequest({
    this.page,
    this.tasks,
  });
}
