import 'package:angular/angular.dart';
import 'package:angular_app/src/routes/routes.dart';
import 'package:angular_router/angular_router.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [routerDirectives,],
  exports: [RoutePaths, Routes,],
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
