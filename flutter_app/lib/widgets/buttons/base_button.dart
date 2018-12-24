import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';
import 'package:flutter_app/widgets/buttons/button_theme.dart';

class BaseButton extends StatelessWidget {
  final shape;
  final AppButtonTheme theme;
  final String text;
  final onTap;
  final Size size;
  final Widget child;

  const BaseButton({
    Key key,
    this.shape,
    this.theme,
    this.text,
    this.onTap,
    this.size,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: theme.color,
      shape: shape,
      child: InkWell(
        customBorder: shape,
        splashColor: AppColors.bright_turquoise,
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(size),
          child: child,
        ),
        onTap: onTap,
      ),
    );
  }
}
