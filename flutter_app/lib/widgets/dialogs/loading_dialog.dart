import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';

class LoadingDialog extends StatefulWidget {
  final String message;
  final WillPopCallback onWillPop;

  const LoadingDialog({
    Key key,
    this.message = '',
    this.onWillPop,
  }) : super(key: key);

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

  static close(BuildContext context) {
    if (_LoadingDialogState.isShowing) {
      Navigator.pop(context);
    }
  }

  @override
  State<StatefulWidget> createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {
  static bool isShowing = false;


  @override
  void initState() {
    super.initState();
    isShowing = true;
  }

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
                child: Text(widget.message),
              )
            ],
          ),
        ),
      ),
      onWillPop: widget.onWillPop,
    );
  }

  @override
  void dispose() {
    isShowing = false;
    super.dispose();
  }
}
