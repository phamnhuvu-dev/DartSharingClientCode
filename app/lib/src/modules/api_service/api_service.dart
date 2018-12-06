import 'dart:mirrors';
import 'package:http/http.dart' as http;

const GET = 0;
const POST = 1;
const PUT = 2;
const DELETE = 3;

class RequestValue {
  final method;
  final url;
  final headers;
  final body;

  const RequestValue({this.method, this.url, this.headers, this.body});
}


abstract class ApiService {
  @override
  dynamic noSuchMethod(Invocation invocation) {
    ClassMirror cm = reflectClass(runtimeType);
    MethodMirror mm = cm.instanceMembers[invocation.memberName];
    RequestValue requestValue = mm.metadata.first.reflectee as RequestValue;

    final body = {};
    invocation.namedArguments.forEach((key, value) {
      body[MirrorSystem.getName(key)] = value;
    });

    switch (requestValue.method) {
      case GET:
        return http.get(
          requestValue.url,
          headers: requestValue.headers,
        );

      case POST:
        return http.post(
          requestValue.url,
          headers: requestValue.headers,
          body: requestValue.body,
        );

      case PUT:
        return http.put(
          requestValue.url,
          headers: requestValue.headers,
        );

      case DELETE:
        return http.delete(
          requestValue.url,
          headers: requestValue.headers,
        );
    }
  }
}


