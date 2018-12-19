import 'dart:async';

import 'package:app/src/modules/api_service.dart';
import 'package:http/http.dart';

class UserApiService extends ApiService {

  Future<Response> login({
    method = POST,
    url = "$HOST/user/login",
    id,
    password,
  });

  Future<Response> register({
    method = POST,
    url = "$HOST/user/register",
    name,
    username,
    email,
    password,
  });
}
