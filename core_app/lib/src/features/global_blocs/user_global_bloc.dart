import 'package:core_app/core_app.dart';
import 'package:core_app/src/data/repositories/user/user_repository.dart';
import 'package:core_app/src/modules/validator.dart';
import 'package:rxdart/rxdart.dart';

class UserGlobalBloc implements Bloc {
  final UserRepository userRepository;
  final Validator validator;

  BehaviorSubject<User> _userSubject;

  UserGlobalBloc({
    this.userRepository,
    this.validator,
  }) {
    _userSubject = BehaviorSubject<User>();
  }

  Stream<User> get user => _userSubject.stream;

  login({
    String account,
    String password,
    bool isEmail,
  }) {
//    userRepository.login(
//      account: account,
//      password: password,
//      is_email: isEmail,
//    );

    _userSubject.add(User("", "adfa", "asdfaf", "adfaf"));
  }

  register({
    String username,
    String accountName,
    String email,
    String password,
    String confirmPassword,
  }) {
    userRepository.register(
      username: username,
      account_name: accountName,
      password: password,
    );
  }

  //////// Valid Login ////////
  final _validLoginSubject = BehaviorSubject<Tuple3<String, String, bool>>();

  Stream<Tuple3<String, String, bool>> get validLogin =>
      _validLoginSubject.stream;

  checkValidLogin({String account, String password}) {
    String messageAccount = "";
    String messagePassword = "";

    if (account.isEmpty) {
      messageAccount = "Không được bỏ trống";
    } else if (!(validator.validEmail(account) ||
        validator.validAccountName(account))) {
      messageAccount = "Tên tài khoản/Email không hợp lệ";
    }

    if (password.isEmpty) {
      messagePassword = "Không được bỏ trống";
    }

    if (messageAccount.isEmpty && messagePassword.isEmpty) {
      login(account: account, password: password, isEmail: validator.validEmail(account));
    } else {
      _validLoginSubject.value = Tuple3(
        messageAccount,
        messagePassword,
        messageAccount.isEmpty && messagePassword.isEmpty,
      );
    }
  }

  //////// Valid Register ////////
  final _validRegisterSubject =
      BehaviorSubject<Tuple6<String, String, String, String, String, bool>>();

  Stream<Tuple6<String, String, String, String, String, bool>>
      get validRegister => _validRegisterSubject.stream;

  @override
  void dispose() {
    _userSubject.close();
  }
}
