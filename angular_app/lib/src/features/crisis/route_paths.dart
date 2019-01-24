import 'package:angular_router/angular_router.dart';

import 'package:angular_app/src/features/main/routes/main_route_paths.dart';
import 'package:angular_app/src/routes/route_paths.dart' as _parent;

class RoutePaths {
  static final crisis = RoutePath(
    path: ':id',
    parent: _parent.RoutePaths.crises,
  );

  static final home = RoutePath(
    path: '',
    parent: _parent.RoutePaths.crises,
    useAsDefault: true,
  );
}
