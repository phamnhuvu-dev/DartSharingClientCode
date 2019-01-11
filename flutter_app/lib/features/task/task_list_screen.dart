import 'package:core_app/core_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/main/main_frame.dart';
import 'package:flutter_app/features/task/task_item.dart';
import 'package:flutter_app/widgets/delete_bar.dart';
import 'package:flutter_app/widgets/dialogs/app_dialog.dart';
import 'package:flutter_app/widgets/dialogs/create_or_update_task.dart';
import 'package:flutter_app/widgets/dialogs/loading.dart';
import 'package:flutter_app/widgets/search_bar.dart';

class TaskListScreen extends StatefulWidget {
  final TaskGlobalBloc taskGlobalBloc;

  const TaskListScreen({Key key, this.taskGlobalBloc}) : super(key: key);

  static _TaskListScreenState cast(State<TaskListScreen> state) {
    return state as _TaskListScreenState;
  }

  @override
  State<StatefulWidget> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  TaskGlobalBloc taskGlobalBloc;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    taskGlobalBloc = widget.taskGlobalBloc;
    taskGlobalBloc.loading.listen((isLoading) {
      if (!isLoading && context != null) {
        AppDialog.close(context);
      }
    });

    if (taskGlobalBloc.taskCount == 0) {
      taskGlobalBloc.loadTasks();
    }

    scrollController.addListener(() {
      if (scrollController.position.extentAfter == 0 &&
          scrollController.position.axisDirection == AxisDirection.down) {
        taskGlobalBloc.loadTasks();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: MainFrame(
        child: buildBody(),
        iconData: Icons.add,
        onTapCircleButton: () {
          AppDialog.show(
            context: context,
            child: CreateOrUpdateTask(
              taskGlobalBloc: taskGlobalBloc,
              onTapCreateOrUpdate: () => AppDialog.show(
                    context: context,
                    child: Loading(
                      message: "Creating Dialog",
                    ),
                  ),
            ),
            backgroundColor: Colors.transparent,
          );
        },
      ),
      onWillPop: () async {
        if (taskGlobalBloc.isDeleteMode) {
          taskGlobalBloc.turnOffDeleteMode();
          return false;
        } else {
          return true;
        }
      },
    );
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            top: 8.0,
            bottom: 8.0,
          ),
          child: StreamBuilder(
            stream: taskGlobalBloc.deleteMode,
            builder: (context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.connectionState == ConnectionState.active &&
                  snapshot.data) {
                return DeleteBar(
                  onTapCancel: taskGlobalBloc.turnOffDeleteMode,
                  onTapDelete: () {
                    AppDialog.show(
                      context: context,
                      child: Loading(
                        message: "Deleting tasks",
                      ),
                    );
                    taskGlobalBloc.deleteTask();
                  },
                );
              } else {
                return SearchBar();
              }
            },
          ),
        ),
        Flexible(
          child: buildListView(),
        ),
      ],
    );
  }

  Widget buildListView() {
    return StreamBuilder(
      stream: taskGlobalBloc.tasks,
      builder: (context, AsyncSnapshot<List<Task>> snapshot) {
        if (snapshot.connectionState != ConnectionState.none &&
            snapshot.data != null) {
          final List<Task> tasks = snapshot.data;

          return ListView.builder(
            controller: scrollController,
            itemCount: tasks.length,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            itemBuilder: (BuildContext context, int index) {
              final task = tasks[index];
              return InkWell(
                onLongPress: () {
                  task.isDeleteSelect = true;
                  taskGlobalBloc.turnOnDeleteMode();
                },
                child: StreamBuilder(
                  stream: taskGlobalBloc.deleteMode,
                  builder: (context, AsyncSnapshot<bool> snapshot) {
                    final bool isDeleteMode =
                        snapshot.connectionState == ConnectionState.active &&
                            snapshot.data;
                    return Container(
                      margin: EdgeInsets.only(
                          bottom:
                              index == tasks.length - 1 ? (64 + 46) / 2 : 15.0),
                      child: TaskItem(
                        task: task,
                        isDeleteMode: isDeleteMode,
                        select: () {
                          widget.taskGlobalBloc.selectTask(task);
                          Navigator.pushNamed(context, Routes.task_detail);
                        },
                      ),
                    );
                  },
                ),
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
