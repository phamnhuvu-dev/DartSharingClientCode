import 'package:core_app/core_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';
import 'package:flutter_app/widgets/scaffold/white_scaffold.dart';

class TaskDetailScreen extends StatelessWidget {
  final TaskGlobalBloc taskGlobalBloc;

  const TaskDetailScreen({Key key, this.taskGlobalBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WhiteScaffold(
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
    );
  }
}
