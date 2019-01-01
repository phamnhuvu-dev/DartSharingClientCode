import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';

class RectTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final double height;
  final TextInputType keyboardType;
  final int maxLines;

  const RectTextField({
    Key key,
    this.hintText = "",
    this.controller,
    this.height = 50.0,
    this.keyboardType,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(
          width: 1.0,
          color: AppColors.royal_blue,
        ),
      ),
      child: Center(
        child: TextField(
          maxLines: maxLines,
          keyboardType: keyboardType,
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
