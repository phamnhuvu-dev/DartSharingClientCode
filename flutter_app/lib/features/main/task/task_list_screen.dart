import 'dart:io';

import 'package:core_app/core_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/main/task/task_item.dart';
import 'package:flutter_app/modules/device_info.dart';
import 'package:flutter_app/widgets/buttons/add_button.dart';
import 'package:flutter_app/widgets/delete_bar.dart';
import 'package:flutter_app/widgets/dialogs/app_dialog.dart';
import 'package:flutter_app/widgets/dialogs/create_task.dart';
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

  @override
  void initState() {
    super.initState();

    taskGlobalBloc = widget.taskGlobalBloc;
    taskGlobalBloc.loading.listen((isLoading) {
      if (!isLoading && context != null) {
        print("----------------");
        AppDialog.close(context);
      }
    });

    if (taskGlobalBloc.taskCount == 0) {
      taskGlobalBloc.loadTasks();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Stack(
        children: <Widget>[
          buildBody(),
          buildAddButton(),
        ],
      ),
      onWillPop: () {
        if (taskGlobalBloc.isDeleteMode) {
          taskGlobalBloc.turnOffDeleteMode();
          return Future.value(false);
        } else {
          return Future.value(true);
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
            key: PageStorageKey("1"),
            itemCount: tasks.length,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            itemBuilder: (BuildContext context, int index) {
              final task = tasks[index];
              return InkWell(
                onLongPress: () {
                  print("LongPress");
                  task.isDeleteSelect = true;
                  taskGlobalBloc.turnOnDeleteMode();
                },
                child: StreamBuilder(
                  stream: taskGlobalBloc.deleteMode,
                  builder: (context, AsyncSnapshot<bool> snapshot) {
                    final bool isDeleteMode =
                        snapshot.connectionState == ConnectionState.active &&
                            snapshot.data;

                    return TaskItem(
                      isLast: index == tasks.length - 1,
                      task: task,
                      isDeleteMode: isDeleteMode,
                      select: () {
                        widget.taskGlobalBloc.selectTask(task);
                        Navigator.pushNamed(context, Routes.task_detail);
                      },
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

  Widget buildAddButton() {
    final deviceInfo = DeviceInfo.of(context);
    double paddingBottom = (64.0 - 46.0) / 2;
    if (Platform.isIOS && deviceInfo.isIPhoneX) {
      paddingBottom += deviceInfo.edgeHeight;
    }
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: paddingBottom,
      child: AddButton(
        onTap: () {
          AppDialog.show(
            context: context,
            child: CreateTask(
              taskGlobalBloc: taskGlobalBloc,
            ),
            backgroundColor: Colors.transparent,
          );
        },
      ),
    );
  }
}
