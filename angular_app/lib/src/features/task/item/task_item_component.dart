import 'package:angular/angular.dart';
import 'package:core_app/core_app.dart' show Task;

@Component(
  selector: 'task-item',
  templateUrl: 'task_item_component.html',
  directives: [coreDirectives],
)
class TaskItemComponent {
  @Input()
  Task task;
}
