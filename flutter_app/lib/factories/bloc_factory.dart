import 'package:flutter/material.dart';
import 'package:flutter_app/features/bloc_provider.dart';
import 'package:app/app.dart';


class BlocFactory {
  static B create<B extends Bloc>(BuildContext context) {
    switch (B) {
      case AppGlobalBloc:
        final appProvider = BlocProvider.of<AppGlobalBloc>(context);
        return (appProvider == null ? AppGlobalBloc() : appProvider) as B;

      default:
        return null;
    }
  }
}