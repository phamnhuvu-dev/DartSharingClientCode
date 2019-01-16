import 'dart:async';

import 'package:async/async.dart';
import 'package:core_app/src/data/models/user/user.dart';
import 'package:core_app/src/data/repositories/user/user_repository.dart';
import 'package:core_app/src/di/injector.dart';
import 'package:core_app/src/features/bloc.dart';
import 'package:core_app/src/modules/api_service.dart';
import 'package:core_app/src/modules/validator.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tuple/tuple.dart';

class UserGlobalBloc implements Bloc {
  final UserRepository userRepository = Injector.get();
  final Validator validator = Injector.get();
  CancelableOperation<User> cancelableOperation;

  final BehaviorSubject<User> _userSubject = BehaviorSubject<User>();

  UserGlobalBloc();

  Stream<User> get user => _userSubject.stream;

  //////// Valid Login ////////
  final BehaviorSubject<Tuple2<String, String>> _validLoginSubject =
      BehaviorSubject<Tuple2<String, String>>();

  Stream<Tuple2<String, String>> get validLogin => _validLoginSubject.stream;

  void checkValidLogin({
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
      cancelableOperation = CancelableOperation.fromFuture(
        userRepository.login(
          account: account,
          password: password,
          is_email: validator.validEmail(account).toString(),
        ),
      );
      cancelableOperation.value.then((user) {
        _userSubject.add(user);
        updateHeaders(_createHeaders(user));
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

  void checkValidRegister({
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
      cancelableOperation =
          CancelableOperation.fromFuture(userRepository.register(
        username: username,
        account_name: accountName,
        email: email,
        password: password,
      ));
      cancelableOperation.value.then((user) {
        _userSubject.add(user);
        updateHeaders(_createHeaders(user));
      }).catchError((error) {
        print(error);
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

  Future<bool> cancelRequest() async {
    print("Cancel");
    cancelableOperation.cancel();
    return true;
  }

  Map<String, String> _createHeaders(User user) {
    return {
      "access_token": user.accessToken,
      "user_id": user.id.toString(),
    };
  }

  @override
  void dispose() {
    _userSubject.close();
    _validLoginSubject.close();
    _validRegisterSubject.close();
  }

  @override
  bool isClose() => _userSubject.isClosed;
}
