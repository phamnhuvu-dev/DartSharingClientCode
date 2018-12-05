import 'package:angular/angular.dart';
import 'package:angular_app/src/features/auth/routes/routes.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'auth',
  styleUrls: ['auth_component.css'],
  templateUrl: 'auth_component.html',
  directives: [RouterOutlet],
  exports: [RoutePaths, Routes],
)
class AuthComponent {}
