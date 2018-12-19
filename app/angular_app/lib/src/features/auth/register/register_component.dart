import 'dart:html';
import 'dart:math';

import 'package:angular/angular.dart';
import 'package:angular_app/messages/i18n.dart';

@Component(
  selector: 'register',
  styleUrls: ['register_component.css'],
  templateUrl: 'register_component.html',
  exports: [I18n],
)
class RegisterComponent implements AfterViewChecked {
  int width = 0;
  int height = 0;
  CanvasElement canvas;
  CanvasRenderingContext2D ctx;

  @override
  void ngAfterViewChecked() {
    _drawOvalHeadCard();
  }

  void _drawOvalHeadCard() {
    Element parent = querySelector('.box');
    canvas = querySelector('#canvas');

    if (parent == null) return;

    final parentWidth = parent.offsetWidth;
    final parentHeight = parent.offsetHeight;

    if (width != parentWidth || height != parentHeight) {
      ctx = canvas.getContext('2d');
      canvas.width = parentWidth;
      canvas.height = parentHeight;
      width = parentWidth;
      height = parentHeight;
      final radius = 10;

      ctx.fillStyle = 'white';
      ctx.imageSmoothingEnabled = true;
      ctx.imageSmoothingQuality = "high";
      ctx.beginPath();
      ctx.ellipse(width / 2, 50, width / 2, 50, 0, pi, 0, false);
      ctx.arcTo(width, height, 0, height, radius);
      ctx.arcTo(0, height, 0, 50, radius);
      ctx.closePath();
      ctx.fill();
    }
  }
}