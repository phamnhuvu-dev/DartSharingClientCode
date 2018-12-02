import 'package:flutter/material.dart';
import 'package:flutter_app/features/login/login_screen.dart';
import 'package:flutter_app/features/register/register_screen.dart';
import 'package:flutter_app/features/splash_creen.dart';

class ScreenWidgetFactory {
  static W create<W extends Widget>(BuildContext context) {
    switch (W) {
      case SplashScreen:
        return SplashScreen() as W;

      case LoginScreen:
        return LoginScreen() as W;

      case RegisterScreen:
        return RegisterScreen() as W;

      default:
        return null;
    }
  }
}
