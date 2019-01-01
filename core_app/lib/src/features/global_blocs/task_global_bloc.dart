import 'package:core_app/src/data/models/task.dart';
import 'package:core_app/src/data/repositories/task/task_repository.dart';
import 'package:core_app/src/features/bloc.dart';
import 'package:rxdart/subjects.dart';
import 'package:tuple/tuple.dart';


class TaskGlobalBloc implements Bloc {
  bool _isLoading = false;

  TaskGlobalBloc(this.taskRepository);

  final TaskRepository taskRepository;

  int _currentPage = 0;

  BehaviorSubject<Tuple2<List<Task>, int>> _tasksSubject =
      BehaviorSubject(seedValue: Tuple2(List(), 0));

  BehaviorSubject<Task> _taskSubject = BehaviorSubject();

  Stream<Tuple2<List<Task>, int>> get tasks => _tasksSubject.stream;

  Stream<Task> get task => _taskSubject.stream;

  void loadTasks() async {
    if (_isLoading) return;
    _isLoading = true;

    _currentPage += 1;
    taskRepository.get({"page": _currentPage}).then((tasks) {
      final currentTube = _tasksSubject.value;
      currentTube.item1.addAll(tasks);
      _tasksSubject.add(currentTube);
      _isLoading = false;
    }).catchError((error) {
      print(error);
      _currentPage -= 1;
      _isLoading = false;
    });
  }

  void createTask(Task task) async {
    if (_isLoading) return;
    _isLoading = true;

    taskRepository.insert(task).then((task) {
      final currentTasks = _tasksSubject.value.item1;
      currentTasks.add(task);
      _tasksSubject.add(Tuple2(currentTasks, 1));
      _isLoading = false;
    }).catchError((error) {
      print(error);
      _isLoading = false;
    });
  }

  void deleteTask(Task task) async {}

  void openTask() {}

  @override
  void dispose() {
    print("Task dispose");
    _tasksSubject.close();
  }

  @override
  bool isClose() {
    return _tasksSubject.isClosed;
  }
}
