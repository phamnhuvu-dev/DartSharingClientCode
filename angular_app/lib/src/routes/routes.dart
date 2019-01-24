import 'package:angular_app/src/features/main/main_component.template.dart'
    as main_component_template;
import 'package:angular_app/src/features/user/auth_component.template.dart'
    as auth_component_template;
import 'package:angular_app/src/routes/route_paths.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_app/src/features/crisis/crisis_list_component.template.dart'
    as crisis_list_template;

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

  static final crises = RouteDefinition(
    routePath: RoutePaths.crises,
    component: crisis_list_template.CrisisListComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    user,
    main,
    crises,
    RouteDefinition.redirect(
      path: '',
      redirectTo: RoutePaths.main.toUrl(),
    ),
  ];
}
