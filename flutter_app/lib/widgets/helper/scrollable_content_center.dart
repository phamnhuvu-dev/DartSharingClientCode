import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class ScrollableContentCenter {
  double top = 0.0;
  final GlobalKey bodyKey = GlobalKey();
  final GlobalKey contentKey = GlobalKey();
  final topSubject = BehaviorSubject<double>(seedValue: 0.0);

  void executeCalculateCenter(State state) {
    final RenderBox body = bodyKey.currentContext.findRenderObject();
    final RenderBox content = contentKey.currentContext.findRenderObject();
    final newTop = (body.size.height - content.size.height) / 2;
    if (newTop != topSubject.value) {
      if (newTop > 0) {
        topSubject.add(newTop);
      } else {
        topSubject.add(0.0);
      }
    }
  }

  Widget scrollableContentCenter({Widget child, EdgeInsetsGeometry padding}) {
    return WillPopScope(
      child: StreamBuilder(
        initialData: 0.0,
        stream: topSubject.stream,
        builder: (context, AsyncSnapshot<double> snapshot) {
          return Padding(
            padding: padding.add(EdgeInsets.only(top: snapshot.data)),
            child: child,
          );
        },
      ),
      onWillPop: () async {
        topSubject.close();
        return true;
      },
    );
  }
}
