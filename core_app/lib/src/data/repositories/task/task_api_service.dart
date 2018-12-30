import 'package:core_app/src/modules/api_service.dart';
import 'package:http/http.dart';

const TASK_URL = "$HOST/api/task";

class TaskApiService extends ApiService {
  Future<Response> getTasks({
    method = GET,
    url = TASK_URL,
    int page,
  });

  Future<Response> createTask({
    method = POST,
    url = TASK_URL,
    String title,
    String description,
  });

  Future<Response> updateTask({
    method = PUT,
    url = TASK_URL,
    String title,
    String description,
  });

  Future<Response> deleteTask({
    method = DELETE,
    url = TASK_URL,
    int id,
  });
}
