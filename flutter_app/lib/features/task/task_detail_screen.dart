import 'package:core_app/core_app.dart' show Injector, TaskGlobalBloc;
import 'package:flutter/material.dart';
import 'package:flutter_app/features/main/main_frame.dart';
import 'package:flutter_app/statics/app_colors.dart';
import 'package:flutter_app/widgets/dialogs/app_dialog.dart';
import 'package:flutter_app/widgets/dialogs/create_or_update_task.dart';
import 'package:flutter_app/widgets/dialogs/loading.dart';

class TaskDetailScreen extends StatefulWidget {

  final TaskGlobalBloc taskGlobalBloc;

  const TaskDetailScreen({Key key,@required this.taskGlobalBloc}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {

  TaskGlobalBloc taskGlobalBloc;
  @override
  void initState() {
    super.initState();

    taskGlobalBloc = widget.taskGlobalBloc;

    taskGlobalBloc.update.listen((updated) {
      if (AppDialog.close(context)) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainFrame(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              taskGlobalBloc.selectedTask.title,
              style: TextStyle(
                color: AppColors.dodger_blue,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(taskGlobalBloc.selectedTask.description),
          ],
        ),
      ),
      iconData: Icons.edit,
      onTapCircleButton: () {
        AppDialog.show(
          context: context,
          child: CreateOrUpdateTask(
            isCreateTask: false,
            task: taskGlobalBloc.selectedTask,
            onTapCreateOrUpdate: () {
              AppDialog.show(
                context: context,
                child: Loading(
                  message: "Updating task",
                ),
              );
            },
          ),
          backgroundColor: Colors.transparent,
        );
      },
    );
  }
}
