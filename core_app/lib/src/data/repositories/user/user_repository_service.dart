import 'dart:convert';

import 'package:core_app/core_app.dart';
import 'package:core_app/src/data/repositories/user/user_api_service.dart';
import 'package:core_app/src/data/repositories/user/user_repository.dart';

class UserRepositoryService extends UserRepository {
  final UserApiService apiService;

  UserRepositoryService(this.apiService);

  @override
  Future<User> login({account, password, is_email}) async {
    final response = await apiService.login(
        account: account, password: password, is_email: is_email);
    Map json = jsonDecode(response.body);
    final userJson = json["user"];
    final user = User.fromJson(userJson);
    user.accessToken = json["access_token"];
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

  @override
  Future<List<User>> get(Map<String, dynamic> by) {
    // TODO: implement get
    return null;
  }

  @override
  Future<Map<String, dynamic>> delete({List<User> items}) {
    // TODO: implement delete
    return null;
  }

  @override
  Future<User> insert(User item) {
    // TODO: implement insert
    return null;
  }

  @override
  Future<Map<String, dynamic>> update(List<User> items) {
    // TODO: implement update
    return null;
  }
}
