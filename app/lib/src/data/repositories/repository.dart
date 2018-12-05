import 'package:app/src/data/repositories/specification.dart';

abstract class Repository<R> {
  List<R> getListBy(Specification specification);

  R getBy(Specification specification);

  bool save(R item);

  bool update(R item);

  bool delete(R item);
}