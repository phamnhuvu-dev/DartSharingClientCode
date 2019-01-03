import 'package:core_app/core_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/main/main_screen.dart';
import 'package:flutter_app/features/main/task/task_list_screen.dart';
import 'package:flutter_app/widgets/buttons/button_theme.dart';
import 'package:flutter_app/widgets/buttons/rect_button.dart';
import 'package:flutter_app/widgets/dialogs/loading_dialog.dart';
import 'package:flutter_app/widgets/oval_head_card.dart';
import 'package:flutter_app/widgets/textfield/rect_textfield.dart';

class CreateTaskDialog extends StatefulWidget {
  final TaskGlobalBloc taskGlobalBloc;
  final WillPopCallback onWillPop;
  final State<TaskListScreen> taskListScreenState;

  const CreateTaskDialog(
      {Key key,
      @required this.taskGlobalBloc,
      this.onWillPop,
      this.taskListScreenState})
      : super(key: key);

  static void show({
    BuildContext context,
    State<TaskListScreen> taskListScreenState,
    @required TaskGlobalBloc taskGlobalBloc,
    WillPopCallback onWillPop,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (builder) {
        return Theme(
          data: ThemeData(
            dialogBackgroundColor: Colors.transparent,
          ),
          child: CreateTaskDialog(
            taskListScreenState: taskListScreenState,
            taskGlobalBloc: taskGlobalBloc,
            onWillPop: onWillPop,
          ),
        );
      },
    );
  }

  static void close(BuildContext context) {
    if (_CreateTaskDialogState.isShowing) {
      Navigator.pop(context);
    }
  }

  @override
  State<StatefulWidget> createState() => _CreateTaskDialogState();
}

class _CreateTaskDialogState extends State<CreateTaskDialog> {

  static bool isShowing;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isShowing = true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: widget.onWillPop,
      child: Dialog(
        child: SingleChildScrollView(
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
                          CreateTaskDialog.close(context);
                          LoadingDialog.show(context: context, message: "Creating Dialog");
                        },
                      ),
                    ),
                    Flexible(
                      child: RectButton(
                        text: "Cancel",
                        theme: MalibuButtonTheme(),
                        onTap: () {
                          CreateTaskDialog.close(context);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    isShowing = false;
    super.dispose();
  }
}
