typedef FactoryFunc<D> = D Function();

class Injector {
  Injector._internal();

  static final _factories = Map<Type, _Factory<dynamic>>();

  static Future<void> register<D>({
    InjectorType type,
    FactoryFunc<D> factoryFunc,
  }) async {
    _factories[D] = _Factory<D>(
      type,
      factoryFunc,
    );
  }

  static D get<D>({bool force = false}) {
    return _factories[D].getDependency(force);
  }
}

enum InjectorType { provide, singleton }

class _Factory<D> {
  InjectorType type;
  D dependency;
  FactoryFunc factoryFunc;

  _Factory(
      this.type,
      this.factoryFunc,
      );

  D getDependency(bool force) {
    switch (type) {
      case InjectorType.provide:
        return factoryFunc() as D;

      case InjectorType.singleton:
        if (dependency == null || force) {
          dependency = factoryFunc() as D;
        }
        return dependency;

      default:
        return null;
    }
  }
}