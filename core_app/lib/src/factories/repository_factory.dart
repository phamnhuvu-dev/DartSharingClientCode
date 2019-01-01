import 'package:core_app/src/data/repositories/task/task_api_service.dart';
import 'package:core_app/src/data/repositories/task/task_repository_service.dart';
import 'package:core_app/src/data/repositories/user/user_api_service.dart';
import 'package:core_app/src/data/repositories/user/user_repository_service.dart';
import 'package:flutter/material.dart';

class RepositoryFactory {
  static R create<R>() {
    switch (R) {
      case UserRepositoryService:
        return UserRepositoryService(UserApiService()) as R;

      case TaskRepositoryService:
        return TaskRepositoryService(TaskApiService()) as R;

      default:
        return null;
    }
  }
}
