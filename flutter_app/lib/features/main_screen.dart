import 'package:core_app/core_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/task/task_list_screen.dart';
import 'package:flutter_app/widgets/bottom_bar.dart';
import 'package:flutter_app/widgets/buttons/add_button.dart';
import 'package:flutter_app/widgets/dialogs/create_task_dialog.dart';
import 'package:flutter_app/widgets/scaffold/white_scaffold.dart';

class MainScreen extends StatefulWidget {
  final TaskGlobalBloc taskGlobalBloc;

  const MainScreen({Key key, @required this.taskGlobalBloc}) : super(key: key);

  static _MainScreenState of(BuildContext context) {
    return context.ancestorStateOfType(const TypeMatcher<_MainScreenState>())
        as _MainScreenState;
  }

  static _MainScreenState cast(State<MainScreen> state) {
    return state as _MainScreenState;
  }

  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isShowingDialog = false;

  @override
  Widget build(BuildContext context) {
    return WhiteScaffold(
      resizeToAvoidBottomPadding: false,
      child: body(),
    );
  }

  Widget body() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 64.0 / 2),
          child: ScreenFactory.create<TaskListScreen>(context: context),
        ),
        addButton(),
        bottomBar(),
      ],
    );
  }

  Widget addButton() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 64.0 / 2 + (64 - 46.0) / 2,
      child: AddButton(
        onTap: () {
          CreateTaskDialog.show(
            mainScreenState: this,
            context: context,
            taskGlobalBloc: widget.taskGlobalBloc,
            onWillPop: () {
              isShowingDialog = true;
              print("Show Loading Dialog");
              return Future.value(true);
            },
          );
        },
      ),
    );
  }

  Widget bottomBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: BottomBar(),
    );
  }
}
