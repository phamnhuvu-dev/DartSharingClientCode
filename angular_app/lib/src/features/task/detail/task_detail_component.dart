import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'task-detail',
  templateUrl: 'task_detail_component.html',
)
class TaskDetailComponent with CanReuse implements OnActivate  {
  var name = 'Angular';
  var id;
  int selectedId = 1;

  @override
  void onActivate(RouterState previous, RouterState current) {
    final id = current.parameters["id"];
    this.id = id == null ? null : int.tryParse(id);
  }
}
