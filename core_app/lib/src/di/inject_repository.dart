import 'package:core_app/src/data/repositories/task/task_api_service.dart';
import 'package:core_app/src/data/repositories/task/task_repository.dart';
import 'package:core_app/src/data/repositories/task/task_repository_service.dart';
import 'package:core_app/src/data/repositories/user/user_api_service.dart';
import 'package:core_app/src/data/repositories/user/user_repository.dart';
import 'package:core_app/src/data/repositories/user/user_repository_service.dart';
import 'package:core_app/src/di/injector.dart';

void injectRepository() {
  Injector.register<UserRepository>(
    type: InjectorType.singleton,
    factoryFunc: () => UserRepositoryService(
          UserApiService(),
        ),
  );

  Injector.register<TaskRepository>(
    type: InjectorType.singleton,
    factoryFunc: () => TaskRepositoryService(
          TaskApiService(),
        ),
  );
}
