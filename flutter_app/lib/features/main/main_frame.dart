import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/modules/device_info.dart';
import 'package:flutter_app/statics/app_colors.dart';
import 'package:flutter_app/widgets/buttons/add_button.dart';
import 'package:flutter_app/widgets/scaffold/white_scaffold.dart';

class MainFrame extends StatelessWidget {
  final Widget child;
  final ValueGetter<void> onTapCircleButton;
  final IconData iconData;

  const MainFrame({
    Key key,
    this.child,
    @required this.onTapCircleButton,
    @required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WhiteScaffold(
      resizeToAvoidBottomPadding: false,
      child: Stack(
        children: <Widget>[
          child,
          buildAddButton(context),
        ],
      ),
    );
  }

  Widget buildAddButton(BuildContext context) {
    final deviceInfo = DeviceInfo.of(context);
    double paddingBottom = (64.0 - 46.0) / 2;
    if (Platform.isIOS && deviceInfo.isIPhoneX) {
      paddingBottom += deviceInfo.edgeHeight;
    }

    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: paddingBottom,
      child: CircleButton(
        icon: Icon(
          iconData,
          color: AppColors.white,
          size: (46.0 / 2 + 8),
        ),
        onTap: onTapCircleButton,
      ),
    );
  }
}
