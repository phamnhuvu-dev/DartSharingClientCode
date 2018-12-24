import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';
import 'package:flutter_app/widgets/buttons/base_button.dart';
import 'package:flutter_app/widgets/buttons/button_theme.dart';

class AddButton extends BaseButton {
  const AddButton({
    Key key,
    onTap,
  }) : super(
          key: key,
          onTap: onTap,
          size: const Size(46.0, 46.0),
          shape: const CircleBorder(),
          theme: const DodgerBlueButtonTheme(),
          child: const Icon(
            Icons.add,
            color: AppColors.white,
            size: (46.0 / 2 + 8),
          ),
        );
}
