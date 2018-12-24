import 'dart:async';

import 'package:core_app/src/modules/api_service.dart';
import 'package:http/http.dart';

const USER = "/api/user";

class UserApiService extends ApiService {

  Future<Response> login({
    method = POST,
    url = "$HOST$USER/login",
    String account,
    String password,
    bool is_email
  });

  Future<Response> register({
    method = POST,
    url = "$HOST$USER/register",
    String username,
    String account_name,
    String email,
    String password,
  });
}
