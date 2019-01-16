import 'package:angular/angular.dart';
import 'package:angular_app/src/features/main/routes/main_routes.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'main',
  styleUrls: ['main_component.css'],
  templateUrl: 'main_component.html',
  directives: [RouterOutlet],
  exports: [MainRoutePaths, MainRoutes],
)
class MainComponent {}
