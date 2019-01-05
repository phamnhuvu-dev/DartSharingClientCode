import 'package:core_app/core_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/buttons/button_theme.dart';
import 'package:flutter_app/widgets/buttons/rect_button.dart';
import 'package:flutter_app/widgets/dialogs/app_dialog.dart';
import 'package:flutter_app/widgets/dialogs/loading.dart';
import 'package:flutter_app/widgets/oval_head_card.dart';
import 'package:flutter_app/widgets/textfield/rect_textfield.dart';

class CreateTask extends StatefulWidget {

  final TaskGlobalBloc taskGlobalBloc;
  final ValueGetter<void> onTapCreate;

  const CreateTask({Key key, this.taskGlobalBloc, this.onTapCreate}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: OvalHeadCard(
        title: "Create Task",
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
                    text: "Create",
                    onTap: () {
                      widget.taskGlobalBloc.createTask(
                        Task(
                          title: titleController.text,
                          description: descriptionController.text,
                        ),
                      );
                      if (AppDialog.close(context)) {
                        widget.onTapCreate();
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