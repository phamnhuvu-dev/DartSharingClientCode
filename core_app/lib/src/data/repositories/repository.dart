import 'package:core_app/src/modules/check_value.dart';

abstract class Repository<R> {
  Future<List<R>> get({Map<String, dynamic> by}) {
    String where = "";
    by.forEach((key, value) {
      if (CheckValue.isNumber(value)) {
        where += key + value;
      } else {
        where += key + "'" + value + "'";
      }
    });
    return null;
  }

  Future<void> insert({List<R> items}) {
    return null;
  }

  Future<void> update({List<R> items}) {
    return null;
  }

  Future<void> delete({List<R> items}) {
    return null;
  }
}
