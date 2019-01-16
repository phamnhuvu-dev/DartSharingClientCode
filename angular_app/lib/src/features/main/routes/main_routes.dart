import 'package:angular_app/src/features/main/routes/main_route_paths.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_app/src/features/task/task_component.template.dart'
    as task_component_template;

export 'main_route_paths.dart';

class MainRoutes {
  static final task = RouteDefinition(
    routePath: MainRoutePaths.task,
    component: task_component_template.TaskComponentNgFactory,
  );

//  static final about = RouteDefinition();

  static final all = <RouteDefinition>[
    task,
//    about,
    RouteDefinition.redirect(
      path: '',
      redirectTo: MainRoutePaths.task.toUrl(),
    )
  ];
}
