import 'dart:async';

import 'package:app/src/modules/api_service.dart';
import 'package:http/http.dart';

const USER = "/api/user";

class UserApiService extends ApiService {

  Future<Response> login({
    method = POST,
    url = "$HOST$USER/login",
    account,
    password,
    is_email
  });

  Future<Response> register({
    method = POST,
    url = "$HOST$USER/register",
    username,
    account_name,
    email,
    password,
  });
}
