//abstract class Repository<R> {
//  final String MESSAGE_KEY = "message";
//  final String SUCCESS_KEY = "success";
//  final String UNSUCCESS_KEY = "unsuccess";
//
//  Future<List<R>> get(Map<String, dynamic> by);
//
//  Future<R> insert(R item);
//
//  Future<Map<String, dynamic>> update(List<R> items);
//
//  Future<Map<String, dynamic>> delete({List<R> items});
//}

abstract class Repository<Q, S> {
  final String MESSAGE_KEY = "message";
  final String SUCCESS_KEY = "success";
  final String UNSUCCESS_KEY = "unsuccess";

  Future<S> get(Q request);

  Future<S> insert(Q request);

  Future<S> update(Q request);

  Future<S> delete(Q request);
}