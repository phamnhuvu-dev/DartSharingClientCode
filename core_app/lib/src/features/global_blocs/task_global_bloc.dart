import 'package:core_app/src/data/models/task.dart';
import 'package:core_app/src/data/repositories/task/task_repository.dart';
import 'package:core_app/src/features/bloc.dart';
import 'package:core_app/src/features/global_blocs/user_global_bloc.dart';
import 'package:rxdart/subjects.dart';

class TaskGlobalBloc implements Bloc {

  TaskGlobalBloc(this.taskRepository);

  final TaskRepository taskRepository;

  int _currentPage = 0;

  BehaviorSubject<List<Task>> _tasksSubject =
      BehaviorSubject(seedValue: List());

  BehaviorSubject<Task> _taskSubject = BehaviorSubject();

  Stream<List<Task>> get tasks => _tasksSubject.stream;

  Stream<Task> get task => _taskSubject.stream;

  void loadTasks() async {
    _currentPage += 1;
    taskRepository.get({"page": _currentPage}).then((tasks) {
      final currentTasks = _tasksSubject.value;
      currentTasks.addAll(tasks);
      _tasksSubject.add(currentTasks);
    }).catchError((error) {
      print(error);
      _currentPage -= 1;
    });
  }

  void openTask() {}

  @override
  void dispose() {
    _tasksSubject.close();
  }
}
