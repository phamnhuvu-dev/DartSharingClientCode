import 'package:core_app/src/factories/bloc_factory.dart';
import 'package:core_app/src/features/global_blocs/task_global_bloc.dart';
import 'package:core_app/src/features/global_blocs/user_global_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/main/task/task_detail_screen.dart';
import 'package:flutter_app/features/main/task/task_list_screen.dart';
import 'package:flutter_app/features/user/login_screen.dart';
import 'package:flutter_app/features/main/main_screen.dart';
import 'package:flutter_app/features/user/register_screen.dart';
import 'package:flutter_app/features/splash_creen.dart';
import 'package:flutter_app/features/main/about/about_screen.dart';

class ScreenFactory {
  static W create<W extends Widget>({BuildContext context}) {
    switch (W) {
      case SplashScreen:
        return SplashScreen() as W;

      case LoginScreen:
        return LoginScreen(
          userGlobalBloc: BlocFactory.create<UserGlobalBloc>(),
        ) as W;

      case RegisterScreen:
        return RegisterScreen(
          userGlobalBloc: BlocFactory.create<UserGlobalBloc>(),
        ) as W;

      case MainScreen:
        return MainScreen(
          taskGlobalBloc: BlocFactory.create<TaskGlobalBloc>(),
        ) as W;

      case TaskListScreen:
        return TaskListScreen(
          taskGlobalBloc: BlocFactory.create<TaskGlobalBloc>(),
        ) as W;

      case TaskDetailScreen:
        return TaskDetailScreen(
          taskGlobalBloc: BlocFactory.create<TaskGlobalBloc>(),
        ) as W;

      case AboutScreen:
        return AboutScreen() as W;

      default:
        return null;
    }
  }
}
