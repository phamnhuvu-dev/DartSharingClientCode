import 'package:core_app/src/data/repositories/task/task_api_service.dart';
import 'package:core_app/src/data/repositories/task/task_repository.dart';
import 'package:core_app/src/data/repositories/task/task_repository_service.dart';
import 'package:core_app/src/di/injector.dart';

injectRepository() async {
  Injector.register<TaskRepository>(
    type: InjectorType.singleton,
    factoryFunc: () => TaskRepositoryService(
          TaskApiService(),
        ),
  );
}
