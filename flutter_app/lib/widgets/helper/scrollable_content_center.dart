import 'package:flutter/material.dart';

class ScrollableContentCenter {
  double top = 0.0;
  final GlobalKey bodyKey = GlobalKey();
  final GlobalKey contentKey = GlobalKey();

  void execute(State state) {
    final RenderBox body = bodyKey.currentContext.findRenderObject();
    final RenderBox content = contentKey.currentContext.findRenderObject();
    final newTop = body.size.height - content.size.height;
    if (newTop != top) {
      top = body.size.height - content.size.height;
      state.setState(() {
        if (top > 0) {
          top = top / 2;
        } else {
          top = 0.0;
        }
      });
    }
  }
}
