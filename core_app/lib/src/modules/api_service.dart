import 'package:http/http.dart' as http;

Map<String, String> appHeaders = Map();

void updateHeaders(Map<String, String> newHeaders) {
  print("update");
  print(newHeaders);
  appHeaders = newHeaders;
  print(appHeaders);
}

const HOST = "https://dart-sharing-code.herokuapp.com";

const GET = 0;
const POST = 1;
const PUT = 2;
const DELETE = 3;

const METHOD = Symbol("method");
const URL = Symbol("url");
const HEADERS = Symbol("headers");

String _getSymbolName(Symbol symbol) {
  final str = RegExp("(\".+\")").firstMatch(symbol.toString()).group(1);
  return str.substring(1, str.length - 1);
}

abstract class ApiService {
  @override
  Future<http.Response> noSuchMethod(Invocation invocation) async {

    final method = invocation.namedArguments[METHOD];
    final url = invocation.namedArguments[URL];
    final headers = invocation.namedArguments[HEADERS];

    final body = {};
    invocation.namedArguments.forEach((key, value) {
      if (!(key == METHOD || key == URL || key == HEADERS)) {
        body[_getSymbolName(key)] = value;
      }
    });

    switch (method) {
      case GET:
        return await http.get(
          url,
          headers: headers,
        );

      case POST:
        return await http.post(
          url,
          headers: headers,
          body: body,
        );

      case PUT:
        return await http.put(
            url,
            headers: headers,
            body: body
        );

      case DELETE:
        return await http.delete(
          url,
          headers: headers,
        );

      default:
        return null;
    }
  }
}