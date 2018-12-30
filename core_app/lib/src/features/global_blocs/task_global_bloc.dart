import 'package:core_app/src/data/models/task.dart';
import 'package:core_app/src/features/bloc.dart';
import 'package:rxdart/subjects.dart';

class TaskGlobalBloc implements Bloc {

  BehaviorSubject<List<Task>> _tasksSubject =
      BehaviorSubject(seedValue: List());
  BehaviorSubject<Task> _taskSubject = BehaviorSubject();

  Stream<List<Task>> get tasks => _tasksSubject.stream;

  Stream<Task> get task => _taskSubject.stream;

  void loadTasks() {

  }

  void openTask() {

  }

  @override
  void dispose() {
    _tasksSubject.close();
  }
}
