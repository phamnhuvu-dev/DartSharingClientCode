import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/buttons/base_button.dart';


class RectButton extends BaseButton {
  RectButton({
    Key key,
    theme,
    text,
    onTap,
  }) : super(
          key: key,
          shape: null,
          theme: theme,
          text: text,
          onTap: onTap,
          border: const BorderRadius.all(Radius.circular(5.0)),
          size: Size(
            double.maxFinite,
            40.0,
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
