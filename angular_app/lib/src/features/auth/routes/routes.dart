import 'package:angular_app/src/features/auth/routes/route_paths.dart';
import 'package:angular_router/angular_router.dart';

import 'package:angular_app/src/features/auth/login/login_component.template.dart'
    as login_component_template;
import 'package:angular_app/src/features/auth/register/register_component.template.dart'
    as register_component_template;

export 'route_paths.dart';

class Routes {
  static final login = RouteDefinition(
    routePath: RoutePaths.login,
    component: login_component_template.LoginComponentNgFactory,
  );

  static final register = RouteDefinition(
    routePath: RoutePaths.register,
    component: register_component_template.RegisterComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    login,
    register,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.login.toUrl(),
    ),
  ];
}
