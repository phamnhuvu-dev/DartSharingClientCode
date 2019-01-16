import 'package:angular/angular.dart';
import 'package:angular_app/src/features/task/item/task_item_component.dart';
import 'package:core_app/core_app.dart' show Task, TaskGlobalBloc;

@Component(
    selector: 'task',
    templateUrl: 'task_component.html',
    directives: [coreDirectives, TaskItemComponent],
    exports: [])
class TaskComponent implements OnInit {
  final TaskGlobalBloc _taskGlobalBloc;
  List<Task> tasks = [];
  var name = 'Angular';

  TaskComponent(this._taskGlobalBloc);

  @override
  void ngOnInit() {
    print(_taskGlobalBloc);
    _taskGlobalBloc.tasks.listen((tasks) {
      print(tasks);
      tasks.addAll([
        Task(title: "Test 1", description: "Description 1"),
        Task(title: "Test 2", description: "Description 2"),
      ]);
      this.tasks = tasks;
    }).onError((error) {

    });
  }
}
