import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';

class Loading extends StatelessWidget {
  final String message;

  const Loading({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
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
    );
  }
}
