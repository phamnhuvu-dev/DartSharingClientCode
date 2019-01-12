import 'package:core_app/core_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/buttons/button_theme.dart';
import 'package:flutter_app/widgets/buttons/rect_button.dart';
import 'package:flutter_app/widgets/dialogs/app_dialog.dart';
import 'package:flutter_app/widgets/oval_head_card.dart';
import 'package:flutter_app/widgets/textfield/rect_textfield.dart';

class CreateOrUpdateTask extends StatefulWidget {
  final ValueGetter<void> onTapCreateOrUpdate;
  final bool isCreateTask;
  final Task task;

  const CreateOrUpdateTask({
    Key key,
    this.onTapCreateOrUpdate,
    this.isCreateTask = true,
    this.task,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateOrUpdateTaskState();
}

class _CreateOrUpdateTaskState extends State<CreateOrUpdateTask> {
  TaskGlobalBloc taskGlobalBloc;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  @override
  void initState() {
    super.initState();
    taskGlobalBloc = Injector.get();
  }

  @override
  Widget build(BuildContext context) {
    final bool isCreateTask = widget.isCreateTask;
    final Task task = widget.task;

    if (!isCreateTask) {
      titleController.text = task.title;
      descriptionController.text = task.description;
    }

    return SingleChildScrollView(
      child: OvalHeadCard(
        title: isCreateTask ? "Create Task" : "Update Task",
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RectTextField(
              controller: titleController,
              keyboardType: TextInputType.text,
            ),
            RectTextField(
              controller: descriptionController,
              height: 200.0,
              maxLines: 200,
              keyboardType: TextInputType.text,
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: RectButton(
                    theme: MalibuButtonTheme(),
                    text: isCreateTask ? "Create" : "Update",
                    onTap: () {
                      if (isCreateTask) {
                        taskGlobalBloc.createTask(
                          Task(
                            title: titleController.text,
                            description: descriptionController.text,
                          ),
                        );
                      } else {
                        widget.task.title = titleController.text;
                        widget.task.description = descriptionController.text;
                        taskGlobalBloc.updateTask();
                      }

                      if (AppDialog.close(context)) {
                        widget.onTapCreateOrUpdate();
                      }
                    },
                  ),
                ),
                Flexible(
                  child: RectButton(
                    text: "Cancel",
                    theme: MalibuButtonTheme(),
                    onTap: () {
                      AppDialog.close(context);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
