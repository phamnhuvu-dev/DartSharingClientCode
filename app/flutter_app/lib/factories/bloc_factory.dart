import 'package:flutter/material.dart';
import 'package:flutter_app/bloc_provider.dart';
import 'package:shared/src/base_bloc.dart';
import 'package:shared/src/global_blocs/app_global_bloc.dart';


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