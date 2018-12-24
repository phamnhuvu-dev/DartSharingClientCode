import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';

class RectTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const RectTextField({Key key, this.hintText = "", this.controller}) : super(key: key);

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
          controller: controller,
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