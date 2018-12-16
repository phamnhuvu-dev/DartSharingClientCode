import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';

class MainBackground extends StatelessWidget {
  final Widget child;

  const MainBackground({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.green, AppColors.main],
          ),
        ),
        child: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
