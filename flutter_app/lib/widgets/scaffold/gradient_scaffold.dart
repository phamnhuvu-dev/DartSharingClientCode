import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';

class GradientScaffold extends StatelessWidget {
  final Widget child;

  const GradientScaffold({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.bright_turquoise, AppColors.malibu],
          ),
        ),
        child: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
