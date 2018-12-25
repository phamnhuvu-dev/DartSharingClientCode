import 'package:core_app/src/data/models/user.dart';
import 'package:core_app/src/data/repositories/repository.dart';
import 'package:core_app/src/data/repositories/user/user_api_service.dart';
import 'package:http/http.dart';

abstract class UserRepository extends Repository<User> {

  Future<User> login({
    String account,
    String password,
    String is_email,
  });

  Future<User> register({
    String username,
    String account_name,
    String email,
    String password,
  });
}
