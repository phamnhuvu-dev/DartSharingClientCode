import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';
import 'package:flutter_app/widgets/buttons/base_button.dart';
import 'package:flutter_app/widgets/buttons/button_theme.dart';

class CircleButton extends BaseButton {
  const CircleButton({
    Key key,
    onTap,
    Icon icon,
  }) : super(
          key: key,
          onTap: onTap,
          size: const Size(46.0, 46.0),
          shape: const CircleBorder(),
          theme: const DodgerBlueButtonTheme(),
          child: icon,
        );
}
