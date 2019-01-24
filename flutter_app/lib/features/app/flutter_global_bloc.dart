import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:core_app/core_app.dart' show Bloc;
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
}
