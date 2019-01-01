import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class ScrollableContentCenterHelper {
  final GlobalKey bodyKey = GlobalKey();
  final GlobalKey contentKey = GlobalKey();
}

class ScrollableContentCenter extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final GlobalKey bodyKey;
  final GlobalKey contentKey;

  const ScrollableContentCenter({
    Key key,
    @required this.child,
    @required this.bodyKey,
    @required this.contentKey,
    this.padding = const EdgeInsets.all(0.0),
  }) : super(key: key);

  static _ScrollableContentCenter of(BuildContext context) {
    return context.ancestorStateOfType(
      const TypeMatcher<_ScrollableContentCenter>(),
    ) as _ScrollableContentCenter;
  }

  @override
  State<ScrollableContentCenter> createState() => _ScrollableContentCenter();
}

class _ScrollableContentCenter extends State<ScrollableContentCenter> {
  double top = 0.0;
  final topSubject = BehaviorSubject<double>(seedValue: 0.0);

  void executeCalculateCenter() {
    final RenderBox body = widget.bodyKey.currentContext.findRenderObject();
    final RenderBox content =
        widget.contentKey.currentContext.findRenderObject();
    final newTop = (body.size.height - content.size.height) / 2;
    if (newTop != topSubject.value) {
      if (newTop > 0) {
        topSubject.add(newTop);
      } else {
        topSubject.add(0.0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (value) {
        executeCalculateCenter();
      },
    );

    return WillPopScope(
      child: StreamBuilder(
        initialData: 0.0,
        stream: topSubject.stream,
        builder: (context, AsyncSnapshot<double> snapshot) {
          return Padding(
            padding: widget.padding.add(EdgeInsets.only(top: snapshot.data)),
            child: widget.child,
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
