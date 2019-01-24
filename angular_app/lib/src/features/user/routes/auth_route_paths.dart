import 'package:angular_router/angular_router.dart';
import 'package:core_app/core_app.dart';
import 'package:angular_app/src/routes/route_paths.dart';

class AuthRoutePaths {
  static final login = RoutePath(
    path: Routes.login,
    parent: RoutePaths.user,
  );

  static final register = RoutePath(
    path: Routes.register,
    parent: RoutePaths.user,
  );
}
