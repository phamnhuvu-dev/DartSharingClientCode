import 'package:core_app/src/modules/network/api_service.dart';
import 'package:http/http.dart';

const TASK_URL = "$HOST/api/task";

class TaskApiService extends ApiService {
  Future<Response> getTasks({
    method = GET,
    String url,
    Map<String, String> headers,
  });

  Future<Response> createTask({
    method = POST,
    url = TASK_URL,
    Map<String, String> headers,
    String title,
    String description,
  });

  Future<Response> updateTask({
    method = PUT,
    url = TASK_URL,
    Map<String, String> headers,
    String task_id,
    String title,
    String description,
  });

  Future<Response> deleteTask({
    method = DELETE,
    String url,
    Map<String, String> headers,
  });
}
