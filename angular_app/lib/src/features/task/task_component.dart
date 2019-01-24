import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_app/src/features/task/item/task_item_component.dart';
import 'package:angular_app/src/features/task/routes/task_routes.dart';
import 'package:angular_router/angular_router.dart';
import 'package:core_app/core_app.dart' show Task, TaskGlobalBloc;

@Component(
    selector: 'task',
    styleUrls: ['task_component.css'],
    templateUrl: 'task_component.html',
    directives: [coreDirectives, TaskItemComponent, RouterOutlet],
    exports: [TaskRoutePaths, TaskRoutes])
class TaskComponent implements OnInit, OnDestroy {
  final Router _router;
  final TaskGlobalBloc _taskGlobalBloc;
  List<Task> tasks = [];
  int selectedId = 0;
  StreamSubscription<List<Task>> streamSubscription;

  TaskComponent(this._taskGlobalBloc, this._router,);

  @override
  void ngOnInit() {
//    print("Init");
//    print(streamSubscription);
//    streamSubscription = _taskGlobalBloc.tasks.listen((tasks) {
//      if (tasks.length < 20) {
//        tasks.addAll([
//          Task(id: 1, title: "Test 1", description: "Description 1"),
//          Task(id: 2, title: "Test 2", description: "Description 2"),
//          Task(id: 3, title: "Test 3", description: "Description 3"),
//        ]);
//      }
//      if (tasks !)
////      print(tasks);
//      this.tasks = tasks;
//    }, onError: (error) {
//
//    });

    if (tasks.length == 0) {
      this.tasks.addAll([
        Task(id: 1, title: "Test 1", description: "Description 1"),
        Task(id: 2, title: "Test 2", description: "Description 2"),
        Task(id: 3, title: "Test 3", description: "Description 3"),
        Task(id: 1, title: "Test 1", description: "Description 1"),
        Task(id: 2, title: "Test 2", description: "Description 2"),
        Task(id: 3, title: "Test 3", description: "Description 3"),
        Task(id: 1, title: "Test 1", description: "Description 1"),
        Task(id: 2, title: "Test 2", description: "Description 2"),
        Task(id: 3, title: "Test 3", description: "Description 3"),
        Task(id: 1, title: "Test 1", description: "Description 1"),
        Task(id: 2, title: "Test 2", description: "Description 2"),
        Task(id: 3, title: "Test 3", description: "Description 3"),
        Task(id: 1, title: "Test 1", description: "Description 1"),
        Task(id: 2, title: "Test 2", description: "Description 2"),
        Task(id: 3, title: "Test 3", description: "Description 3"),
        Task(id: 1, title: "Test 1", description: "Description 1"),
        Task(id: 2, title: "Test 2", description: "Description 2"),
        Task(id: 3, title: "Test 3", description: "Description 3"),
        Task(id: 1, title: "Test 1", description: "Description 1"),
        Task(id: 2, title: "Test 2", description: "Description 2"),
        Task(id: 3, title: "Test 3", description: "Description 3"),
      ]);
    }

  }

  void onSelect(Task task) {
//    streamSubscription = _taskGlobalBloc.tasks.listen((tasks) {
//      tasks.addAll([
//        Task(id: 1, title: "Test 1", description: "Description 1"),
//        Task(id: 2, title: "Test 2", description: "Description 2"),
//        Task(id: 3, title: "Test 3", description: "Description 3"),
//      ]);
////      print(tasks);
//      this.tasks = tasks;
//    }, onError: (error) {
//
//    });
  print("OK");
    _router.navigate(TaskRoutePaths.detail.toUrl(parameters: {"id": "${task.id}"}));
  }

  @override
  void ngOnDestroy() {
//    streamSubscription.cancel();
  }
}
