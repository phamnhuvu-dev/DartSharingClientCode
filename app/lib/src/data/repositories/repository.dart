abstract class Repository<R> {
  Future<List<R>> get({Map<String, dynamic> by});

  Future<void> insert({List<dynamic> items});

  Future<void> update({List<R> items});

  Future<void> delete({List<R> items});
}
