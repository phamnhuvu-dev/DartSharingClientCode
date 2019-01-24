import 'package:angular_app/src/features/main/routes/main_route_paths.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_app/src/features/task/task_component.template.dart'
    as task_component_template;

import 'package:angular_app/src/features/crisis/crisis_list_component.template.dart' as crisis_list_template;

export 'main_route_paths.dart';

class MainRoutes {
  static final task = RouteDefinition(
    routePath: MainRoutePaths.task,
    component: task_component_template.TaskComponentNgFactory,
  );

  static final crises = RouteDefinition(
    routePath: MainRoutePaths.crises,
    component: crisis_list_template.CrisisListComponentNgFactory,
  );

//  static final about = RouteDefinition();

  static final all = <RouteDefinition>[
    task,
    crises,
//    about,
    RouteDefinition.redirect(
      path: '',
      redirectTo: MainRoutePaths.crises.toUrl(),
    )
  ];


}
