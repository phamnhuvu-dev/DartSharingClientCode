import 'package:core_app/core_app.dart';
import 'package:flutter/material.dart';

class RepositoryFactory {
  static R create<R>({BuildContext context}) {
    switch (R) {
      case UserRepositoryService:
        return UserRepositoryService(UserApiService()) as R;

      default:
        return null;
    }
  }
}