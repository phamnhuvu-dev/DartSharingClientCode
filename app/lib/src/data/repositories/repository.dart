abstract class Repository<R> {

  Future<List<dynamic>> get<I extends R>(List<dynamic> values);

  Future<List<dynamic>> insert<I extends R>(List<dynamic> items);

  Future<List<dynamic>> update<I extends R>(List<R> items);

  Future<List<dynamic>> delete<I extends R>(List<R> items);
}