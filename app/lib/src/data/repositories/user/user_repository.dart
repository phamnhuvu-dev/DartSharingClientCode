import 'package:app/app.dart';
import 'package:app/src/data/repositories/repository.dart';
import 'package:app/src/data/repositories/user/user_task_id.dart';
import 'package:app/src/modules/api_service/auth_api_service.dart';

class UserRepository implements Repository<User, UserTaskId> {

  final AuthApiService service;

  UserRepository(this.service);

  @override
  Future<List> insertList<I>(items) {
    // TODO: implement createList
    return null;
  }

  @override
  Future<List> deleteList<I>(List<User> items) {
    // TODO: implement deleteList
    return null;
  }

  @override
  Future<List> get<I>(Map values) {
    // TODO: implement get
    return null;
  }

  @override
  Future<List> updateList<I>(List<User> items) {
    // TODO: implement updateList
    return null;
  }
}