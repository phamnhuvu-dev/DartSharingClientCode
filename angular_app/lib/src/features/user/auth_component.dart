import 'package:angular/angular.dart';
import 'package:angular_app/src/features/user/routes/auth_routes.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'user',
  styleUrls: ['auth_component.css'],
  templateUrl: 'auth_component.html',
  directives: [RouterOutlet],
  exports: [AuthRoutePaths, AuthRoutes],
)
class AuthComponent implements OnInit{
  @override
  void ngOnInit() {
    print("OnInit");
  }
}
