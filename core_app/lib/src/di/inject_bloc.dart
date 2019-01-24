import 'package:core_app/src/di/injector.dart';
import 'package:core_app/src/features/task_global_bloc.dart';
import 'package:core_app/src/features/user_global_bloc.dart';

void injectBloc() {
//  Injector.register<FlutterGlobalBloc>(
//    type: InjectorType.singleton,
//    factoryFunc: () => FlutterGlobalBloc(),
//  );

  Injector.register<UserGlobalBloc>(
    type: InjectorType.singleton,
    factoryFunc: () => UserGlobalBloc(
          Injector.get(),
          Injector.get(),
        ),
  );

  Injector.register<TaskGlobalBloc>(
    type: InjectorType.singleton,
    factoryFunc: () => TaskGlobalBloc(Injector.get()),
  );
}
