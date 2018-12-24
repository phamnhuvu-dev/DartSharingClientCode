import 'package:core_app/core_app.dart';
import 'package:core_app/src/data/repositories/user/user_repository.dart';
import 'package:core_app/src/modules/validator.dart';
import 'package:rxdart/rxdart.dart';

class UserGlobalBloc implements Bloc {
  final UserRepository userRepository;

  BehaviorSubject<User> _userSubject;

  UserGlobalBloc({this.userRepository}) {
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

    print("OK");
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

  @override
  void dispose() {
    _userSubject.close();
  }
}
