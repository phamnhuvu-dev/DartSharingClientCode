import 'package:flutter/material.dart';
import 'package:flutter_app/factories/bloc_factory.dart';
import 'package:flutter_app/features/login_screen.dart';
import 'package:flutter_app/features/register_screen.dart';
import 'package:flutter_app/features/splash_creen.dart';
import 'package:shared/shared.dart';

class ScreenWidgetFactory {
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

      default:
        return null;
    }
  }
}
