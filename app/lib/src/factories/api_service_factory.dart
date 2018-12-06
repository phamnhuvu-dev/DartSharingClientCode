import 'dart:mirrors';

import 'package:app/src/modules/api_service/api_service.dart';

class ApiServiceFactory {
  static A create<A extends ApiService>() {
    ClassMirror cm = reflectClass(A);
    return cm.newInstance(Symbol.empty, []).reflectee as A;
  }
}