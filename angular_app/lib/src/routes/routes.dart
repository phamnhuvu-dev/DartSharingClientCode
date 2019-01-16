import 'package:angular_app/src/features/auth/auth_component.template.dart'
    as auth_component_template;

import 'package:angular_app/src/features/main/main_component.template.dart' as main_component_template;

import 'package:angular_app/src/routes/route_paths.dart';
import 'package:angular_router/angular_router.dart';

export 'route_paths.dart';

class Routes {
  static final user = RouteDefinition(
    routePath: RoutePaths.user,
    component: auth_component_template.AuthComponentNgFactory,
  );

  static final main = RouteDefinition(
    routePath: RoutePaths.main,
    component: main_component_template.MainComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    user,
    main,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.main.toUrl(),
    ),
  ];
}
