import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';

class LoadingDialog extends StatelessWidget {
  final String message;
  final WillPopCallback popCallback;

  const LoadingDialog({
    Key key,
    this.message = '',
    this.popCallback,
  }) : super(key: key);

//
//  Future<bool> _onWillPop(context) async {
//    return Navigator.of(context) ?? false;
//  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Dialog(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.bright_turquoise),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text(message),
                )
              ],
            ),
          ),
        ),
        onWillPop: popCallback);
  }
}
