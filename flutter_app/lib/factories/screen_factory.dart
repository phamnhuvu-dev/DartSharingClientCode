import 'package:flutter/material.dart';
import 'package:flutter_app/factories/bloc_factory.dart';
import 'package:flutter_app/features/user/login_screen.dart';
import 'package:flutter_app/features/main_screen.dart';
import 'package:flutter_app/features/user/register_screen.dart';
import 'package:flutter_app/features/splash_creen.dart';
import 'package:core_app/core_app.dart';

class ScreenFactory {
  static W create<W extends Widget>({BuildContext context}) {
    switch (W) {
      case SplashScreen:
        return SplashScreen() as W;

      case LoginScreen:
        return LoginScreen(
          userGlobalBloc: BlocFactory.create<UserGlobalBloc>(context: context),
        ) as W;

      case RegisterScreen:
        return RegisterScreen(
          userGlobalBloc: BlocFactory.create<UserGlobalBloc>(context: context),
        ) as W;

      case MainScreen:
        return MainScreen() as W;

      default:
        return null;
    }
  }
}
