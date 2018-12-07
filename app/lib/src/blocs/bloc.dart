import 'dart:mirrors';

abstract class Bloc {
  B create<B extends Bloc>() {
    ClassMirror cm = reflectClass(B);
    return cm.newInstance(Symbol.empty, []).reflectee as B;
  }

  void dispose();
}