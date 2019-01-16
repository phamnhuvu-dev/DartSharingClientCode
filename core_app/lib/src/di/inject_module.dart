import 'package:core_app/src/di/injector.dart';
import 'package:core_app/src/modules/validator.dart';

injectModule() {
  Injector.register<Validator>(
    type: InjectorType.singleton,
    factoryFunc: () => Validator(),
  );
}