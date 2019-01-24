import 'package:angular_app/src/features/main/routes/main_route_paths.dart';
import 'package:angular_router/angular_router.dart';

class TaskRoutePaths {
  static final detail = RoutePath(
    path: '/:id',
    parent: MainRoutePaths.task,
  );
}