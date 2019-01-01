import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';

class WhiteScaffold extends StatelessWidget {
  final Widget child;
  final bool resizeToAvoidBottomPadding;

  const WhiteScaffold({Key key, this.child, this.resizeToAvoidBottomPadding = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: resizeToAvoidBottomPadding,
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
