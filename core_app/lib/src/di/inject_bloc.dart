import 'package:core_app/src/data/repositories/task/task_repository.dart';
import 'package:core_app/src/di/injector.dart';
import 'package:core_app/src/features/global_blocs/task_global_bloc.dart';

injectBloc() async {
  Injector.register<TaskGlobalBloc>(
    type: InjectorType.singleton,
    factoryFunc: () => TaskGlobalBloc(
          Injector.get<TaskRepository>(),
        ),
  );
}
