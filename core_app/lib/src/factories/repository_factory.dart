import 'package:core_app/core_app.dart';
import 'package:flutter/material.dart';

class RepositoryFactory {
  static R create<R>({BuildContext context}) {
    switch (R) {
      case UserService:
        return UserService(UserApiService()) as R;

      default:
        return null;
    }
  }
}