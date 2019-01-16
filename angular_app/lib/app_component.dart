import 'package:angular/angular.dart';
import 'package:angular_app/messages/i18n.dart';
import 'package:angular_app/src/routes/routes.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [routerDirectives,],
  exports: [RoutePaths, Routes, I18n],
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
