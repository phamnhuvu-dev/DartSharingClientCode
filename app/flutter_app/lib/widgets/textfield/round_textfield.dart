import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';

class RoundTextField extends StatelessWidget {
  final String hintText;

  const RoundTextField({Key key, this.hintText = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(
          width: 1.0,
          color: AppColors.royal_blue,
        ),
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
