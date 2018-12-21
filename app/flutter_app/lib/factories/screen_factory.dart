import 'package:flutter/material.dart';
import 'package:flutter_app/factories/bloc_factory.dart';
import 'package:flutter_app/features/login_screen.dart';
import 'package:flutter_app/features/main_screen.dart';
import 'package:flutter_app/features/register_screen.dart';
import 'package:flutter_app/features/splash_creen.dart';
import 'package:app/app.dart';

class ScreenFactory {
  static W create<W extends Widget>(BuildContext context) {
    switch (W) {
      case SplashScreen:
        return SplashScreen() as W;

      case LoginScreen:
        return LoginScreen(
          loginBloc: BlocFactory.create<LoginBloc>(context),
        ) as W;

      case RegisterScreen:
        return RegisterScreen(
          registerBloc: BlocFactory.create<RegisterBloc>(context),
        ) as W;

      case MainScreen:
        return MainScreen() as W;

      default:
        return null;
    }
  }
}
