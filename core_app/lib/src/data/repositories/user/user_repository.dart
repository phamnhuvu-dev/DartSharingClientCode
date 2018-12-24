import 'package:app/src/data/models/user.dart';
import 'package:app/src/data/repositories/repository.dart';

class UserRepository implements Repository<User> {
  @override
  Future<void> delete({List<User> items}) {
    // TODO: implement delete
    return null;
  }

  @override
  Future<List<User>> get({Map<String, dynamic> by}) {
    // TODO: implement get
    return null;
  }

  @override
  Future<void> insert({List items}) {
    // TODO: implement insert
    return null;
  }

  @override
  Future<void> update({List<User> items}) {
    // TODO: implement update
    return null;
  }
}
