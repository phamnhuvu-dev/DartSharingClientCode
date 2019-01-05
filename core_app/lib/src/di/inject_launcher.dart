import 'package:core_app/src/data/repositories/user/user_api_service.dart';
import 'package:core_app/src/data/repositories/user/user_repository.dart';
import 'package:core_app/src/data/repositories/user/user_repository_service.dart';
import 'package:core_app/src/di/injector.dart';
import 'package:core_app/src/features/global_blocs/flutter_global_bloc.dart';
import 'package:core_app/src/features/global_blocs/user_global_bloc.dart';
import 'package:core_app/src/modules/validator.dart';
import 'package:flutter_app/features/user/login_screen.dart';

injectLauncher() {
  Injector.register<UserRepository>(
    type: InjectorType.singleton,
    factoryFunc: () => UserRepositoryService(
          UserApiService(),
        ),
  );

  Injector.register<FlutterGlobalBloc>(
    type: InjectorType.singleton,
    factoryFunc: () => FlutterGlobalBloc(),
  );

  Injector.register<UserGlobalBloc>(
    type: InjectorType.singleton,
    factoryFunc: () => UserGlobalBloc(
          userRepository: Injector.get<UserRepository>(),
          validator: Validator(),
        ),
  );

  Injector.register<LoginScreen>(
    type: InjectorType.provide,
    factoryFunc: () => LoginScreen(
          userGlobalBloc: Injector.get<UserGlobalBloc>(),
        ),
  );
}
