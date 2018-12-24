import 'package:core_app/src/features/bloc.dart';
import 'package:rxdart/subjects.dart';
import 'package:tuple/tuple.dart';

class LoginBloc extends Bloc {
  final _validLoginSubject = BehaviorSubject<Tuple3<String, String, bool>>();

  Stream<Tuple3<String, String, bool>> get validLogin =>
      _validLoginSubject.stream;


  checkValidLogin({String account, String password}) {
    String messageAccount = "";
    String messagePassword = "";

    if (account.isEmpty) {
      messageAccount = "Không được bỏ trống";
    } else {}

    if (password.isEmpty) {
      messagePassword = "Không được bỏ trống";
    } else {}

    _validLoginSubject.value = Tuple3(
      messageAccount,
      messagePassword,
      messageAccount.isEmpty && messagePassword.isEmpty,
    );
  }

  @override
  void dispose() {
    _validLoginSubject.close();
  }
}
