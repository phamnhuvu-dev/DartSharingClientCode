import 'package:core_app/src/data/models/task.dart';
import 'package:core_app/src/data/repositories/task/task_repository.dart';
import 'package:core_app/src/data/repositories/task/task_request.dart';
import 'package:core_app/src/features/bloc.dart';
import 'package:rxdart/subjects.dart';

class TaskGlobalBloc implements Bloc {
  TaskGlobalBloc({this.taskRepository});

  final TaskRepository taskRepository;

  int _currentPage = 0;

  ///////////// DELETE MODE SUBJECT //////////////
  BehaviorSubject<bool> _deleteModeSubject = BehaviorSubject(seedValue: false);

  Stream<bool> get deleteMode => _deleteModeSubject.stream;

  bool get isDeleteMode => _deleteModeSubject.value;

  void turnOnDeleteMode() async {
    _deleteModeSubject.add(true);
  }

  void turnOffDeleteMode() async {
    _deleteModeSubject.add(false);
    _tasksSubject.value.forEach((task) => task.isDeleteSelect = false);
  }

  ///////////// LOADING SUBJECT ////////////////////
  bool _isLoading = false;

  Stream<bool> get loading => _loadingSubject.stream;

  PublishSubject<bool> _loadingSubject = PublishSubject();

  void _loading() {
    print(_isLoading);
    if (_isLoading) return;
    _isLoading = true;
    _loadingSubject.add(_isLoading);
  }

  void _loaded() {
    _isLoading = false;
    _loadingSubject.add(_isLoading);
  }

  ////////////// TASK LIST SUBJECT //////////////////
  BehaviorSubject<List<Task>> _tasksSubject =
      BehaviorSubject(seedValue: List());

  Stream<List<Task>> get tasks => _tasksSubject.stream;

  int get taskCount => _tasksSubject.value.length;

  void loadTasks() async {
    _loading();

    _currentPage += 1;
    taskRepository.get(TaskRequest(page: _currentPage)).then((response) {
      final currentTask = _tasksSubject.value;
      currentTask.addAll(response.tasks);
      _tasksSubject.add(currentTask);
      _loaded();
    }).catchError((error) {
      print(error);
      _currentPage -= 1;
      _loaded();
    });
  }

  void createTask(Task task) async {
    _loading();

    taskRepository.insert(TaskRequest(tasks: [task])).then((response) {
      final currentTasks = _tasksSubject.value;
      currentTasks.addAll(response.tasks);
      _tasksSubject.add(currentTasks);
      _loaded();
    }).catchError((error) {
      print(error);
      _loaded();
    });
  }

  PublishSubject<bool> deleteSubject = PublishSubject();

  Stream<bool> get delete => deleteSubject.stream;

  void deleteTask() async {
    _loading();

    final deleteTasks = _tasksSubject.value
        .where(
          (task) => task.isDeleteSelect,
        )
        .toList();

    taskRepository
        .delete(TaskRequest(tasks: deleteTasks))
        .then((response) async {
      response.deletedIDs.forEach(
          (id) => _tasksSubject.value.removeWhere((task) => id == task.id));
      _tasksSubject.add(_tasksSubject.value);

      final isSuccess = deleteTasks.length == response.deletedIDs.length;
      deleteSubject.add(isSuccess);
      _loaded();
    }).catchError((error) {
      print(error);
      _loaded();
    });
  }

  ////////////////// TASK SELECT ///////////////
  Task selectedTask;

//
//  BehaviorSubject<Task> _taskSubject = BehaviorSubject();
//
//  Stream<Task> get task => _taskSubject.stream;

  void selectTask(Task task) {
    selectedTask = task;
  }

  //////////////// OTHERS ///////////////
  @override
  void dispose() {
    print("Task dispose");
    _tasksSubject.close();
    _loadingSubject.close();
//    _taskSubject.close();
    _deleteModeSubject.close();
  }

  @override
  bool isClose() {
    return _tasksSubject.isClosed;
  }
}
