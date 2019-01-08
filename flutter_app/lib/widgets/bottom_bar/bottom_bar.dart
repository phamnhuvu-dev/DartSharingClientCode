import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_app/modules/device_info.dart';
import 'package:flutter_app/statics/app_colors.dart';
import 'package:flutter_app/widgets/bottom_bar/bottom_bar_item.dart';
import 'package:rxdart/subjects.dart';

class BottomBar extends StatefulWidget {
  final initialIndex;
  final List<BottomBarItem> children;
  final ValueChanged<int> onTap;

  const BottomBar(
      {Key key,
      this.children = const <BottomBarItem>[],
      this.initialIndex = 0,
      this.onTap})
      : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  Color selectColor = AppColors.dodger_blue;
  Color unSelectColor = AppColors.white;
  BehaviorSubject<int> clickSubject;

  @override
  void initState() {
    super.initState();
    clickSubject = BehaviorSubject(seedValue: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    double height = 64.0;
    double paddingBottom = 0.0;
    if (Platform.isIOS && DeviceInfo.of(context).isIPhoneX) {
      paddingBottom = 34.0;
      height += paddingBottom;
    }

    final width = MediaQuery.of(context).size.width;

    return StreamBuilder(
      stream: clickSubject.stream,
      builder: (context, AsyncSnapshot<int> snapshot) {
        List<Widget> children = widget.children.map(
          (item) {
            final currentIndex = snapshot.data;
            final index = widget.children.indexOf(item);
            final isSelect = currentIndex == index;
            return InkWell(
              onTap: () {
                clickSubject.add(index);
                widget.onTap(index);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    item.icon.icon,
                    color: isSelect ? selectColor : unSelectColor,
                  ),
                  Text(
                    item.title,
                    style: TextStyle(
                      color: isSelect ? selectColor : unSelectColor,
                      fontWeight:
                          isSelect ? FontWeight.bold : FontWeight.normal,
                    ),
                  )
                ],
              ),
            );
          },
        ).toList();

        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            GestureDetector(onTap: () {
              print("OK");
            }, child: CustomPaint(
              size: Size(width, height),
              foregroundPainter: BottomPainter(),
            ),),
            Padding(
              padding: EdgeInsets.only(bottom: paddingBottom),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              ),
            )
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    clickSubject.close();
    super.dispose();
  }
}

class BottomPainter extends CustomPainter {
  final Color color;
  var _path = Path();

  BottomPainter({this.color = AppColors.bright_turquoise});

  final _paint = Paint()..isAntiAlias = true;

  double _width = 0.0;
  double _height = 0.0;

  @override
  void paint(Canvas canvas, Size size) {
    /*
     point0----point5    point4----point3
     |                                  |
     |                                  |
     point1------------------------point2
     */

    if (_width != size.width || _height != size.height) {
      final width = size.width;
      final height = size.height;
      final zero = 0.0;

      final gradient = ui.Gradient.linear(
        Offset(zero, zero),
        Offset(width, zero),
        [AppColors.bright_turquoise, AppColors.malibu],
      );

      _paint.shader = gradient;

      final pointX0 = zero;
      final pointY0 = zero;

      final pointX1 = zero;
      final pointY1 = height;

      final pointX2 = width;
      final pointY2 = height;

      final pointX3 = width;
      final pointY3 = zero;

      final pointX4 = (width + 64.0) / 2;
      final pointY4 = zero;

      final pointX5 = (width - 64.0) / 2;
      final pointY5 = zero;

      _path.reset();
      _path.moveTo(pointX0, pointY0);
      _path.lineTo(pointX1, pointY1);
      _path.lineTo(pointX2, pointY2);
      _path.lineTo(pointX3, pointY3);
      _path.lineTo(pointX4, pointY4);
      _path.arcTo(
          Rect.fromLTRB(pointX5, -64.0 / 2, pointX4, 64.0 / 2), 0.0, pi, false);
      _path.lineTo(pointX5, pointY5);
      _path.close();
    }
    canvas.drawPath(_path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  @override
  bool hitTest(Offset position) {
    return _path.contains(position);
  }
}
