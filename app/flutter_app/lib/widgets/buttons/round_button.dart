import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';
import 'package:flutter_app/widgets/buttons/button_theme.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final AppButtonTheme theme;
  final onTap;

  const RoundButton({
    Key key,
    @required this.theme,
    this.text = "",
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      color: theme.color,
      child: InkWell(
        splashColor: AppColors.bright_turquoise,
        child: Container(
          height: 40.0,
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
        ),
        onTap: onTap,
      ),
    );
  }
}
