import 'dart:convert';

import 'package:core_app/core_app.dart';
import 'package:core_app/src/data/repositories/user/user_api_service.dart';
import 'package:core_app/src/data/repositories/user/user_repository.dart';

class UserService extends UserRepository {
  final UserApiService apiService;

  UserService(this.apiService);

  @override
  Future<User> login({account, password, is_email}) async {
    final response = await apiService.login(
        account: account, password: password, is_email: is_email);
    Map json = jsonDecode(response.body);
    final userJson = json["user"];
    final user = User.fromJson(userJson);
    return user;
  }

  @override
  Future<User> register({username, account_name, email, password}) async {
    final response = await apiService.register(
      username: username,
      account_name: account_name,
      email: email,
      password: password,
    );
    Map json = jsonDecode(response.body);
    final userJson = json["user"];
    final user = User.fromJson(userJson);
    return user;
  }
}
