import 'package:core_app/src/data/models/task.dart';
import 'package:core_app/src/data/repositories/repository.dart';

abstract class TaskRepository extends Repository<Task> {
  final String PAGE_KEY = "page";
  final String TASKS_KEY = "tasks";
  final String TASK_KEY = "task";
  final String TASK_IDS_KEY = "task_ids";
  final String DELETED_IDS_KEY = "deleted_ids";
  final String ERRORS_IDS_KEY = "errors_ids";
}
