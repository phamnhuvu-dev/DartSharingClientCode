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
  static B create<B extends Bloc>({BuildContext context}) {
    switch (B) {
      case FlutterGlobalBloc:
        final flutterGlobalBloc = BlocProvider.of<FlutterGlobalBloc>(context);
        return (flutterGlobalBloc == null
            ? FlutterGlobalBloc()
            : flutterGlobalBloc as B);

      case UserGlobalBloc:
        final userGlobalBloc = BlocProvider.of<UserGlobalBloc>(context);
        return (userGlobalBloc == null
            ? UserGlobalBloc(
                userRepository:
                    RepositoryFactory.create<UserRepositoryService>(),
                validator: Validator(),
              )
            : userGlobalBloc) as B;

      case TaskGlobalBloc:
        final taskGlobalBloc = BlocProvider.of<TaskGlobalBloc>(context);
        return (taskGlobalBloc == null
            ? TaskGlobalBloc(
                RepositoryFactory.create<TaskRepositoryService>(context: context),
              )
            : taskGlobalBloc) as B;
      default:
        return null;
    }
  }
}
