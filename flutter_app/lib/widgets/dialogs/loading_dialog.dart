import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';

class LoadingDialog extends StatelessWidget {
  final String message;
  final WillPopCallback onWillPop;

  const LoadingDialog({
    Key key,
    this.message = '',
    this.onWillPop,
  }) : super(key: key);

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
      onWillPop: onWillPop,
    );
  }

  static show(
      {BuildContext context, String message, WillPopCallback onWillPop}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (builder) {
        return Theme(
          data: ThemeData(dialogBackgroundColor: Colors.white),
          child: LoadingDialog(
            message: message,
            onWillPop: onWillPop,
          ),
        );
      },
    );
  }
}
