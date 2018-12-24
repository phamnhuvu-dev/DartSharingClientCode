import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';

class AppButtonTheme {
  final Color color;
  final Color textColor;

  const AppButtonTheme({this.color, this.textColor});
}

class MalibuButtonTheme extends AppButtonTheme {
  const MalibuButtonTheme()
      : super(
          color: AppColors.malibu,
          textColor: AppColors.white,
        );
}

class DodgerBlueButtonTheme extends AppButtonTheme {
  const DodgerBlueButtonTheme()
      : super(
          color: AppColors.dodger_blue,
          textColor: AppColors.white,
        );
}
