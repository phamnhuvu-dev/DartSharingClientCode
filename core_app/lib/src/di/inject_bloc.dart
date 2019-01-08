import 'package:core_app/src/di/injector.dart';
import 'package:core_app/src/features/global_blocs/flutter_global_bloc.dart';
import 'package:core_app/src/features/global_blocs/task_global_bloc.dart';
import 'package:core_app/src/features/global_blocs/user_global_bloc.dart';
import 'package:core_app/src/modules/validator.dart';

void injectBloc() {
  Injector.register<FlutterGlobalBloc>(
    type: InjectorType.singleton,
    factoryFunc: () => FlutterGlobalBloc(),
  );

  Injector.register<UserGlobalBloc>(
    type: InjectorType.singleton,
    factoryFunc: () => UserGlobalBloc(
          userRepository: Injector.get(),
          validator: Validator(),
        ),
  );

  Injector.register<TaskGlobalBloc>(
    type: InjectorType.singleton,
    factoryFunc: () => TaskGlobalBloc(
          taskRepository: Injector.get(),
        ),
  );
}
