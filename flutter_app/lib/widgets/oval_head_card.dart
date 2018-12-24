import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';

class OvalHeadCard extends StatefulWidget {
  final enableSetState;
  final String title;
  final Widget child;
  final double left;
  final double top;
  final double right;
  final double bottom;

  const OvalHeadCard({
    Key key,
    @required this.child,
    this.title = "",
    this.left = 20.0,
    this.top = 0.0,
    this.right = 20.0,
    this.bottom = 25.0,
    this.enableSetState = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OvalHeadCard();
}

class _OvalHeadCard extends State<OvalHeadCard> {
  double baseline = 50.0;
  double fontSize = 20.0;
  Size _size = Size(0.0, 0.0);
  GlobalKey _keyChild = GlobalKey();

  _updateDrawCustom() {
    final RenderBox renderBox = _keyChild.currentContext.findRenderObject();
    if (_size.height != renderBox.size.height ||
        _size.width != renderBox.size.width) {
      _size = Size(
        renderBox.size.width,
        renderBox.size.height,
      );
      if (widget.enableSetState) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((value) {
      _updateDrawCustom();
    });
    return Stack(
      children: <Widget>[
        CustomPaint(
          size: _size,
          foregroundPainter: _OvalHeadCardPainter(),
        ),
        Padding(
          key: _keyChild,
          padding: EdgeInsets.only(
            left: widget.left,
            right: widget.right,
            bottom: widget.bottom,
          ),
          child: Column(
            children: <Widget>[
              Center(
                child: Baseline(
                  baseline: baseline,
                  baselineType: TextBaseline.ideographic,
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: fontSize,
                        color: AppColors.dodger_blue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: widget.top,
                ),
                child: widget.child,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _OvalHeadCardPainter extends CustomPainter {
  double _width = 0.0;
  double _height = 0.0;

  final Path _path = Path();
  final Paint _paint = Paint()..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Size size) {
    /*
    /-------------------------\
    point1              point2
    |                         |
    |                         |
    point4--------------point3

     */
    double width = size.width;
    double height = size.height;

    if (_width != width || _height != height) {
      _width = width;
      _height = height;

      _paint.color = Colors.white;

      double zero = 0.0;
      double borderRadius = 5.0;

      Rect oval = Rect.fromLTWH(0.0, 0.0, _width, 100.0);
      Rect arc3 = Rect.fromCircle(
        center: Offset(_width - borderRadius, _height - borderRadius),
        radius: borderRadius,
      );

      Rect arc4 = Rect.fromCircle(
        center: Offset(borderRadius, _height - borderRadius),
        radius: borderRadius,
      );

      double top = oval.height / 2;
      double point1X = zero;
      double point1Y = top;

      _path.reset();
      _path.moveTo(point1X, point1Y);
      _path.arcTo(oval, pi, pi, false);
      _path.arcTo(arc3, zero, pi / 2, false);
      _path.arcTo(arc4, pi / 2, pi / 2, false);
      _path.close();
    }

    canvas.drawPath(_path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
