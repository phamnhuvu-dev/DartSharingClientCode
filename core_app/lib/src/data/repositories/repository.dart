abstract class Repository<R> {

  Future<List<R>> get(Map<String, dynamic> by);

  Future<R> insert(R item);

  Future<String> update(R item);

  Future<List<String>> delete({List<R> items});
}
