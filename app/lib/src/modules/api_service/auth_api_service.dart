import 'package:app/src/modules/api_service/api_service.dart';
import 'package:http/http.dart';

class AuthApiService extends ApiService {
  @RequestValue(

  )
  Future<Response> login();

  @RequestValue(

  )
  Future<Response> register();
}
