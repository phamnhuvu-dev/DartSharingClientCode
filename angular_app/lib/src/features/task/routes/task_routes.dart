import 'package:angular_app/src/features/task/detail/task_detail_component.template.dart'
as task_detail_template;
import 'package:angular_app/src/features/task/routes/task_route_paths.dart';
import 'package:angular_router/angular_router.dart';

export 'task_route_paths.dart';

class TaskRoutes {
  static final detail = RouteDefinition(
    routePath: TaskRoutePaths.detail,
    component: task_detail_template.TaskDetailComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    detail,
  ];
}
