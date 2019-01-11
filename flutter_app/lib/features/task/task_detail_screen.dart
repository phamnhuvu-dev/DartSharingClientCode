import 'package:core_app/core_app.dart' show TaskGlobalBloc;
import 'package:flutter/material.dart';
import 'package:flutter_app/features/main/main_frame.dart';
import 'package:flutter_app/statics/app_colors.dart';
import 'package:flutter_app/widgets/dialogs/app_dialog.dart';
import 'package:flutter_app/widgets/dialogs/create_or_update_task.dart';

class TaskDetailScreen extends StatefulWidget {
  final TaskGlobalBloc taskGlobalBloc;

  const TaskDetailScreen({Key key, this.taskGlobalBloc}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final taskGlobalBloc = widget.taskGlobalBloc;
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
            taskGlobalBloc: taskGlobalBloc,
            isCreateTask: false,
            task: taskGlobalBloc.selectedTask,
            onTapCreateOrUpdate: () {
              setState(() {});
            },
          ),
          backgroundColor: Colors.transparent,
        );
      },
    );
  }
}
