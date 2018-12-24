import 'package:core_app/src/data/models/user.dart';
import 'package:core_app/src/data/repositories/repository.dart';
import 'package:core_app/src/data/repositories/user/user_api_service.dart';

abstract class UserRepository {

  login({
    String account,
    String password,
    bool is_email,
  });

  register({
    String username,
    String account_name,
    String email,
    String password,
  });
}
