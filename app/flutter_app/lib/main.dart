import 'dart:io';

import 'package:app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/factories/bloc_factory.dart';
import 'package:flutter_app/factories/screen_factory.dart';
import 'package:flutter_app/features/bloc_provider.dart';
import 'package:flutter_app/features/login_screen.dart';
import 'package:flutter_app/features/main_screen.dart';
import 'package:flutter_app/features/register_screen.dart';
import 'package:flutter_app/generated/i18n.dart';
import 'package:flutter_app/modules/device_info.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:device_info/device_info.dart';

void main() async {
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
    return BlocProvider<AppGlobalBloc>(
      bloc: BlocFactory.create(context),
      child: MaterialApp(
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        routes: {
//          Routes.initial: (context) =>
//              ScreenWidgetFactory.create<SplashScreen>(context),
          "/main": (context) => ScreenFactory.create<MainScreen>(context),

          Routes.initial: (context) =>
              ScreenFactory.create<LoginScreen>(context),
          Routes.register: (context) =>
              ScreenFactory.create<RegisterScreen>(context),
        },
        initialRoute: Routes.initial,
      ),
    );
  }
}
