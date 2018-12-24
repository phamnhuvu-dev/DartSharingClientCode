import 'package:core_app/src/features/bloc.dart';
import 'package:rxdart/subjects.dart';
import 'package:tuple/tuple.dart';

class RegisterBloc extends Bloc {
  final _validRegisterSubject =
      BehaviorSubject<Tuple6<String, String, String, String, String, bool>>();

  Stream<Tuple6<String, String, String, String, String, bool>>
      get validRegister => _validRegisterSubject.stream;

  @override
  void dispose() {
    _validRegisterSubject.close();
  }
}
