import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';

class WhiteScaffold extends StatelessWidget {
  final Widget child;

  const WhiteScaffold({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: AppColors.white,
        child: SafeArea(
          bottom: false,
          child: child,
        ),
      ),
    );
  }
}
