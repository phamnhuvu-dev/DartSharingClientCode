import 'package:core_app/src/data/repositories/task/task_repository_service.dart';
import 'package:core_app/src/data/repositories/user/user_repository_service.dart';
import 'package:core_app/src/factories/repository_factory.dart';
import 'package:core_app/src/features/bloc.dart';
import 'package:core_app/src/features/global_blocs/flutter_global_bloc.dart';
import 'package:core_app/src/features/global_blocs/task_global_bloc.dart';
import 'package:core_app/src/features/global_blocs/user_global_bloc.dart';
import 'package:core_app/src/modules/validator.dart';
import 'package:flutter/material.dart';
import 'package:core_app/src/features/bloc_provider.dart';

class BlocFactory {
  static FlutterGlobalBloc _flutterGlobalBloc;
  static UserGlobalBloc _userGlobalBloc;
  static TaskGlobalBloc _taskGlobalBloc;

  static B create<B extends Bloc>() {
    switch (B) {
      case FlutterGlobalBloc:
        if (_flutterGlobalBloc == null || _flutterGlobalBloc.isClose()) {
          _flutterGlobalBloc = FlutterGlobalBloc();
        }
        return _flutterGlobalBloc as B;

      case UserGlobalBloc:
        if (_userGlobalBloc == null || _userGlobalBloc.isClose()) {
          _userGlobalBloc = UserGlobalBloc(
            userRepository: RepositoryFactory.create<UserRepositoryService>(),
            validator: Validator(),
          );
        }
        return _userGlobalBloc as B;

      case TaskGlobalBloc:
        if (_taskGlobalBloc == null || _taskGlobalBloc.isClose()) {
          _taskGlobalBloc = TaskGlobalBloc(
            RepositoryFactory.create<TaskRepositoryService>(),
          );
        }
        return _taskGlobalBloc as B;

      default:
        return null;
    }
  }
}
