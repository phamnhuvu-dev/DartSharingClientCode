import 'package:core_app/src/factories/repository_factory.dart';
import 'package:flutter/material.dart';
import 'package:core_app/src/features/bloc_provider.dart';
import 'package:core_app/core_app.dart';

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
                userRepository: RepositoryFactory.create<UserRepositoryService>(),
                validator: Validator(),
              )
            : userGlobalBloc) as B;

      default:
        return null;
    }
  }
}
