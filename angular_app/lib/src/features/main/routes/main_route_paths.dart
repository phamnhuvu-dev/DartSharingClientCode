import 'package:angular_app/src/routes/route_paths.dart';
import 'package:angular_router/angular_router.dart';

class MainRoutePaths {
  static final task = RoutePath(
    path: '/task',
    parent: RoutePaths.main,
  );

  static final about = RoutePath(
    path: '/about',
    parent: RoutePaths.main,
  );

  static final crises = RoutePath(
    path: '/crises',
    parent: RoutePaths.main,
  );
}
