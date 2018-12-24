import 'package:flutter/material.dart';
import 'package:flutter_app/features/bloc_provider.dart';
import 'package:core_app/core_app.dart';

class BlocFactory {
  static B create<B extends Bloc>({BuildContext context}) {
    switch (B) {
      case AppGlobalBloc:
        final appGlobalBloc = BlocProvider.of<AppGlobalBloc>(context);
        return (appGlobalBloc == null ? AppGlobalBloc() : appGlobalBloc) as B;

      case UserGlobalBloc:
        final userGlobalBloc = BlocProvider.of<UserGlobalBloc>(context);
        return (userGlobalBloc == null ? UserGlobalBloc() : userGlobalBloc)
            as B;

      case LoginBloc:
        return LoginBloc() as B;

      case RegisterBloc:
        return RegisterBloc() as B;

      default:
        return null;
    }
  }
}
