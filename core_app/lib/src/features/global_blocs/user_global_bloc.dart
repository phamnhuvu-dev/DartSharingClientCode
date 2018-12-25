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

//  login({
//    String account,
//    String password,
//    bool isEmail,
//  }) async {
//    userRepository
//        .login(
//      account: account,
//      password: password,
//      is_email: isEmail,
//    )
//        .then((user) {
//      _userSubject.add(user);
//    });
//  }

//  register({
//    String username,
//    String accountName,
//    String email,
//    String password,
//  }) {
//    userRepository
//        .register(
//      username: username,
//      account_name: accountName,
//      email: email,
//      password: password,
//    )
//        .then((user) {
//      _userSubject.add(user);
//    });
//  }

  //////// Valid Login ////////
  final _validLoginSubject = BehaviorSubject<Tuple2<String, String>>();

  Stream<Tuple2<String, String>> get validLogin => _validLoginSubject.stream;

  checkValidLogin({
    String account,
    String password,
  }) async {
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
      userRepository
          .login(
        account: account,
        password: password,
        is_email: validator.validEmail(account).toString(),
      )
          .then((user) {
        print(user);

        _userSubject.add(user);
      }).catchError((error) {
        print(error);
      });
    } else {
      _validLoginSubject.add(
        Tuple2(
          messageAccount,
          messagePassword,
        ),
      );
    }
  }

  //////// Valid Register ////////
  final _validRegisterSubject =
      BehaviorSubject<Tuple5<String, String, String, String, String>>();

  Stream<Tuple5<String, String, String, String, String>> get validRegister =>
      _validRegisterSubject.stream;

  checkValidRegister({
    String username,
    String accountName,
    String email,
    String password,
    String confirmPassword,
  }) async {
    String messageUsername = "";
    String messageAccountName = "";
    String messageEmail = "";
    String messagePassword = "";
    String messageConfirmPassword = "";

    if (username.isEmpty) {
      messageUsername = "Không được bỏ trống";
    }

    if (accountName.isEmpty) {
      messageAccountName = "Không được bỏ trống";
    } else if (validator.validAccountName(accountName)) {}

    if (email.isEmpty) {
      messageEmail = "Không được bỏ trống";
    } else if (validator.validEmail(email)) {}

    if (password.isEmpty && confirmPassword.isEmpty) {
      messagePassword = "Không được bỏ trống";
      messageConfirmPassword = "Không được bỏ trống";
    } else if (password.isEmpty) {
      messagePassword = "Không được bỏ trống";
    } else if (confirmPassword.isEmpty) {
      messageConfirmPassword = "Không được bỏ trống";
    } else if (password != confirmPassword) {
      messageConfirmPassword = "Mật khẩu xác nhận không trùng khớp";
    }

    if (messageUsername.isEmpty &&
        messageAccountName.isEmpty &&
        messageEmail.isEmpty &&
        messagePassword.isEmpty &&
        messageConfirmPassword.isEmpty) {
      userRepository
          .register(
        username: username,
        account_name: accountName,
        email: email,
        password: password,
      )
          .then((user) {
        _userSubject.add(user);
      });
    } else {
      _validRegisterSubject.add(
        Tuple5(
          messageUsername,
          messageAccountName,
          messageEmail,
          messagePassword,
          messageConfirmPassword,
        ),
      );
    }
  }

  @override
  void dispose() {
    _userSubject.close();
  }
}
