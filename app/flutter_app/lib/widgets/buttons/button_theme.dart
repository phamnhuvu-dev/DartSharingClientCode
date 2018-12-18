import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';

class AppButtonTheme {
  Color color;
  Color textColor;
}

class MalibuButtonTheme extends AppButtonTheme {

  MalibuButtonTheme() {
    this.color = AppColors.malibu;
    this.textColor = AppColors.white;
  }
}

class DodgerBlueButtonTheme extends AppButtonTheme {
  DodgerBlueButtonTheme() {
    this.color = AppColors.dodger_blue;
    this.textColor = AppColors.white;
  }
}