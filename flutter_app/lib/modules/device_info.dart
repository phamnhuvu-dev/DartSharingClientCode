import 'package:flutter/material.dart';

class DeviceInfo extends InheritedWidget {
  final bool isIPhoneX;
  final double edgeHeight = 34.0;
  final double bottomBarHeight = 64.0;

  const DeviceInfo({
    Key key,
    @required this.isIPhoneX,
    @required Widget child,
  }) : super(key: key, child: child);

  static DeviceInfo of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(DeviceInfo);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
