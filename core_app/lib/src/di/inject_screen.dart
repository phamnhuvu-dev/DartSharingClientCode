import 'package:core_app/src/di/injector.dart';
import 'package:core_app/src/features/global_blocs/task_global_bloc.dart';
import 'package:core_app/src/features/global_blocs/user_global_bloc.dart';
import 'package:flutter_app/features/main/about/about_screen.dart';
import 'package:flutter_app/features/main/main_screen.dart';
import 'package:flutter_app/features/main/task/task_detail_screen.dart';
import 'package:flutter_app/features/main/task/task_list_screen.dart';
import 'package:flutter_app/features/user/register_screen.dart';

injectScreen() async {
  Injector.register<RegisterScreen>(
    type: InjectorType.provide,
    factoryFunc: () => RegisterScreen(
          userGlobalBloc: Injector.get<UserGlobalBloc>(),
        ),
  );

  Injector.register<MainScreen>(
    type: InjectorType.provide,
    factoryFunc: () => MainScreen(
          taskGlobalBloc: Injector.get<TaskGlobalBloc>(),
        ),
  );

  Injector.register<TaskListScreen>(
    type: InjectorType.provide,
    factoryFunc: () => TaskListScreen(
          taskGlobalBloc: Injector.get<TaskGlobalBloc>(),
        ),
  );

  Injector.register<TaskDetailScreen>(
    type: InjectorType.provide,
    factoryFunc: () => TaskDetailScreen(
          taskGlobalBloc: Injector.get<TaskGlobalBloc>(),
        ),
  );

  Injector.register<AboutScreen>(
    type: InjectorType.provide,
    factoryFunc: () => AboutScreen(),
  );
}
