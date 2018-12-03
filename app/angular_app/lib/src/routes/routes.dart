import 'package:angular_app/src/features/auth/auth_component.template.dart'
    as auth_component_template;
import 'package:angular_app/src/routes/route_paths.dart';
import 'package:angular_router/angular_router.dart';

export 'route_paths.dart';

class Routes {
  static final auth = RouteDefinition(
    routePath: RoutePaths.auth,
    component: auth_component_template.AuthComponentNgFactory,

  );

  static final all = <RouteDefinition>[
    auth,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.auth.toUrl(),
    ),
  ];
}
