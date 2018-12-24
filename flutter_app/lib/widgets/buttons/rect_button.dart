import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/buttons/base_button.dart';
import 'package:flutter_app/widgets/buttons/button_theme.dart';

class RectButton extends BaseButton {
  RectButton({
    Key key,
    onTap,
    AppButtonTheme theme,
    String text,
    double border = 5.0,
    double height = 40.0,
  }) : super(
          key: key,
          onTap: onTap,
          theme: theme,
          text: text,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(border)),
          size: Size(
            double.maxFinite,
            height,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: theme.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        );
}
