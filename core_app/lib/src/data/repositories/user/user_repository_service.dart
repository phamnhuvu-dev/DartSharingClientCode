import 'dart:convert';

import 'package:core_app/core_app.dart';
import 'package:core_app/src/data/repositories/user/user_api_service.dart';
import 'package:core_app/src/data/repositories/user/user_repository.dart';
import 'package:core_app/src/data/models/user/user_request.dart';
import 'package:core_app/src/data/models/user/user_response.dart';

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
  Future<UserResponse> delete(UserRequest request) {
    // TODO: implement delete
    return null;
  }

  @override
  Future<UserResponse> get(UserRequest request) {
    // TODO: implement get
    return null;
  }

  @override
  Future<UserResponse> insert(UserRequest request) {
    // TODO: implement insert
    return null;
  }

  @override
  Future<UserResponse> update(UserRequest request) {
    // TODO: implement update
    return null;
  }
}
