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

  static D get<D>() {
    return _factories[D].getDependency();
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

  D getDependency() {
    switch (type) {
      case InjectorType.provide:
        return factoryFunc() as D;

      case InjectorType.singleton:
        if (dependency == null) {
          dependency = factoryFunc() as D;
        }
        return dependency;

      default:
        return null;
    }
  }
}