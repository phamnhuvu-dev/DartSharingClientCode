import 'dart:html';
import 'dart:math';
import 'package:angular/angular.dart';
import 'package:angular_app/messages/i18n.dart';
import 'package:angular_app/src/features/auth/routes/routes.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'login',
  styleUrls: ['login_component.css'],
  templateUrl: 'login_component.html',
  directives: [MaterialInputComponent, routerDirectives],
  exports: [RoutePaths, Routes, I18n],
)
class LoginComponent implements AfterViewChecked {
  final Router _router;

  int width = 0;
  int height = 0;
  CanvasElement canvas;
  CanvasRenderingContext2D ctx;

  LoginComponent(this._router);

  void onClickLogin() {
    print("login");
  }

  void goToRegister() {
    print("register");
    _router.navigate(RoutePaths.register.toUrl());
  }

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
