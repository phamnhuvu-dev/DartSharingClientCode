import 'dart:async';

abstract class Repository<R, I> {

  Future<List<dynamic>> get<I>(Map values);

  Future<List<dynamic>> insertList<I>(dynamic items);

  Future<List<dynamic>> updateList<I>(List<R> items);

  Future<List<dynamic>> deleteList<I>(List<R> items);
}