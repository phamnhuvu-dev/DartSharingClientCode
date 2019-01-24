import 'package:core_app/src/data/models/task/task.dart';
import 'package:core_app/src/data/models/task/task_request.dart';
import 'package:core_app/src/data/repositories/task/task_repository.dart';
import 'package:core_app/src/features/bloc.dart';
import 'package:core_app/src/modules/network/web_socket_service.dart';
import 'package:rxdart/subjects.dart';

class TaskGlobalBloc implements Bloc {

  final TaskRepository taskRepository;
  final WebSocketService ws = WebSocketService();

  int _currentPage = 0;

  TaskGlobalBloc(this.taskRepository) {
    ws.connect();
  }

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

  PublishSubject<bool> _loadingSubject = PublishSubject();

  Stream<bool> get loading => _loadingSubject.stream;

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

  //// LOAD
  void loadTasks() async {
    _loading();

    _currentPage += 1;
    taskRepository.get(TaskRequest(page: _currentPage)).then((response) {
      int length = response.tasks.length;
      if (length < 10) {
        _currentPage -= 1;
      }

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

  //// CREATE
  void createTask(Task task) async {
    _loading();

    taskRepository.insert(TaskRequest(tasks: [task])).then((response) {
      final currentTasks = _tasksSubject.value;
      currentTasks.insertAll(0, response.tasks);
      _tasksSubject.add(currentTasks);
      _loaded();
    }).catchError((error) {
      print(error);
      _loaded();
    });
  }

  //// UPDATE
  PublishSubject<bool> _updateSubject = PublishSubject();

  Stream<bool> get update => _updateSubject.stream;

  void updateTask() async {
    _loading();

    taskRepository.update(TaskRequest(tasks: [selectedTask])).then((response) {
      if (response.successIDs.length == 1) {
        _updateSubject.add(true);
        _loaded();
      } else {
        _updateSubject.add(false);
        _loaded();
      }
    });
  }

  //// DELETE
  PublishSubject<bool> _deleteSubject = PublishSubject();

  Stream<bool> get delete => _deleteSubject.stream;

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
      response.successIDs.forEach(
          (id) => _tasksSubject.value.removeWhere((task) => id == task.id));
      _tasksSubject.add(_tasksSubject.value);

      final isSuccess = deleteTasks.length == response.successIDs.length;
      _deleteSubject.add(isSuccess);
      _loaded();
    }).catchError((error) {
      print(error);
      _loaded();
    });
  }

  ////////////////// TASK SELECT ///////////////
  Task selectedTask;

  void selectTask(Task task) {
    selectedTask = task;
  }

  //////////////// OTHERS ///////////////
  @override
  void dispose() {
    print("Task dispose");
    _tasksSubject.close();
    _loadingSubject.close();
    _deleteModeSubject.close();
    _deleteSubject.close();

    print("Task refresh");
    //// Refresh ////
    _tasksSubject = BehaviorSubject(seedValue: List());
    _loadingSubject = PublishSubject();
    _deleteModeSubject = BehaviorSubject(seedValue: false);
    _deleteSubject = PublishSubject();

    _currentPage = 0;
    _isLoading = false;
    selectedTask = null;
  }
}
