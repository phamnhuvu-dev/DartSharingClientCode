import 'dart:async';

import 'package:core_app/src/features/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:rxdart/subjects.dart';

class FlutterGlobalBloc implements Bloc {
  final BehaviorSubject<bool> _connectivitySubject = BehaviorSubject();

  StreamSubscription<ConnectivityResult> subscription;

  FlutterGlobalBloc() {
    Connectivity().checkConnectivity().then((result) {
      _connectivitySubject.add(result != ConnectivityResult.none);
    });
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        _connectivitySubject.add(result != ConnectivityResult.none);
      },
    );
  }

  @override
  void dispose() {
    subscription.cancel();
    _connectivitySubject.close();
  }

  @override
  bool isClose() => _connectivitySubject.isClosed;
}
