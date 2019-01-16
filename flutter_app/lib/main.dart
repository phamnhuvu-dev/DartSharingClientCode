import 'dart:io';

import 'package:core_app/core_app.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/main/main_screen.dart';
import 'package:flutter_app/features/user/login_screen.dart';
import 'package:flutter_app/features/user/register_screen.dart';
import 'package:flutter_app/generated/i18n.dart';
import 'package:flutter_app/modules/device_info.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  injectModule();
  injectRepository();
  injectBloc();

  bool isIphoneX = false;
  if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await DeviceInfoPlugin().iosInfo;
    isIphoneX = iosInfo.name == "iPhone X";
  }

  runApp(DeviceInfo(isIPhoneX: isIphoneX, child: App()));
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      routes: {
        Routes.main: (context) => MainScreen(),
        Routes.initial: (context) => LoginScreen(),
        Routes.register: (context) => RegisterScreen(),
      },
      initialRoute: Routes.initial,
    );
  }
}
