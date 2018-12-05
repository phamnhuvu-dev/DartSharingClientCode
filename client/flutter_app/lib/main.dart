import 'package:flutter/material.dart';
import 'package:flutter_app/bloc_provider.dart';
import 'package:flutter_app/factories/bloc_factory.dart';
import 'package:flutter_app/factories/screen_widget_factory.dart';
import 'package:flutter_app/features/login_screen.dart';
import 'package:flutter_app/features/register_screen.dart';
import 'package:flutter_app/generated/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared/shared.dart';

void main() => runApp(App());

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
          Routes.initial: (context) =>
              ScreenWidgetFactory.create<LoginScreen>(context),
          Routes.register: (context) =>
              ScreenWidgetFactory.create<RegisterScreen>(context),
        },
        initialRoute: Routes.initial,
      ),
    );
  }
}
