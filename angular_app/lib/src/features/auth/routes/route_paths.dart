import 'package:angular_router/angular_router.dart';
import 'package:core_app/core_app.dart';
import 'package:angular_app/src/routes/route_paths.dart' as _parent;

class RoutePaths {
  static final login = RoutePath(
    path: Routes.login,
    parent: _parent.RoutePaths.auth,
  );

  static final register = RoutePath(
    path: Routes.register,
    parent: _parent.RoutePaths.auth,
  );
}
