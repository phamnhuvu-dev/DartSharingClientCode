import 'package:core_app/core_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/main_screen.dart';
import 'package:flutter_app/widgets/buttons/button_theme.dart';
import 'package:flutter_app/widgets/buttons/rect_button.dart';
import 'package:flutter_app/widgets/dialogs/loading_dialog.dart';
import 'package:flutter_app/widgets/oval_head_card.dart';
import 'package:flutter_app/widgets/textfield/rect_textfield.dart';

class CreateTaskDialog extends StatefulWidget {
  final TaskGlobalBloc taskGlobalBloc;
  final WillPopCallback onWillPop;
  final State<MainScreen> mainScreenState;

  const CreateTaskDialog(
      {Key key,
      @required this.taskGlobalBloc,
      this.onWillPop,
      this.mainScreenState})
      : super(key: key);

  static void show({
    BuildContext context,
    State<MainScreen> mainScreenState,
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
            mainScreenState: mainScreenState,
            taskGlobalBloc: taskGlobalBloc,
            onWillPop: onWillPop,
          ),
        );
      },
    );
  }

  @override
  State<StatefulWidget> createState() => _CreateTaskDialog();
}

class _CreateTaskDialog extends State<CreateTaskDialog> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
                          Navigator.pop(context);
                          MainScreen.cast(widget.mainScreenState).isShowingDialog = true;
                          LoadingDialog.show(
                              context: context, message: "Creating Task");
                        },
                      ),
                    ),
                    Flexible(
                      child: RectButton(
                        text: "Cancel",
                        theme: MalibuButtonTheme(),
                        onTap: () {
                          Navigator.pop(context);
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
}
