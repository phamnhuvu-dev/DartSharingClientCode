import 'package:flutter/material.dart';
import 'package:flutter_app/bloc_provider.dart';
import 'package:shared/shared.dart';


class BlocFactory {
  static B create<B extends BaseBloc>(BuildContext context) {
    switch (B) {
      case AppGlobalBloc:
        final appProvider = BlocProvider.of<AppGlobalBloc>(context);
        return (appProvider == null ? AppGlobalBloc() : appProvider) as B;

      default:
        return null;
    }
  }
}