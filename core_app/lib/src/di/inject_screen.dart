import 'package:core_app/src/di/injector.dart';
import 'package:flutter_app/features/about/about_screen.dart';
import 'package:flutter_app/features/main/main_screen.dart';
import 'package:flutter_app/features/task/task_detail_screen.dart';
import 'package:flutter_app/features/task/task_list_screen.dart';
import 'package:flutter_app/features/user/login_screen.dart';
import 'package:flutter_app/features/user/register_screen.dart';

void injectScreen() {
  Injector.register<LoginScreen>(
    type: InjectorType.provide,
    factoryFunc: () => LoginScreen(
          userGlobalBloc: Injector.get(),
        ),
  );

  Injector.register<RegisterScreen>(
    type: InjectorType.provide,
    factoryFunc: () => RegisterScreen(
          userGlobalBloc: Injector.get(),
        ),
  );

  Injector.register<MainScreen>(
    type: InjectorType.provide,
    factoryFunc: () => MainScreen(
          taskGlobalBloc: Injector.get(),
        ),
  );

  Injector.register<TaskListScreen>(
    type: InjectorType.provide,
    factoryFunc: () => TaskListScreen(
          taskGlobalBloc: Injector.get(),
        ),
  );

  Injector.register<TaskDetailScreen>(
    type: InjectorType.provide,
    factoryFunc: () => TaskDetailScreen(
          taskGlobalBloc: Injector.get(),
        ),
  );

  Injector.register<AboutScreen>(
    type: InjectorType.provide,
    factoryFunc: () => AboutScreen(
          userGlobalBloc: Injector.get(),
        ),
  );
}
