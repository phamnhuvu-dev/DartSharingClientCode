import 'package:core_app/core_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/main_screen.dart';
import 'package:flutter_app/statics/app_colors.dart';
import 'package:flutter_app/widgets/scaffold/white_scaffold.dart';

class TaskListScreen extends StatefulWidget {
  final TaskGlobalBloc taskGlobalBloc;

  const TaskListScreen({Key key, this.taskGlobalBloc}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return WhiteScaffold(
      child: body(),
    );
  }

  Widget body() {
    return StreamBuilder(
      stream: widget.taskGlobalBloc.tasks,
      builder: (context, AsyncSnapshot<Tuple2<List<Task>, int>> snapshot) {
        print(snapshot.data);
        if (snapshot.connectionState != ConnectionState.none &&
            snapshot.data != null) {
          final List<Task> tasks = snapshot.data.item1;
          if (tasks.length == 0 && snapshot.connectionState == ConnectionState.active) {
            widget.taskGlobalBloc.loadTasks();
          }

          if (MainScreen.of(context).isShowingDialog && snapshot.data.item2 == 1) {
            Future(() => Navigator.pop(context));
            MainScreen.of(context).isShowingDialog = false;
          }

          return ListView.builder(
            itemCount: tasks.length,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            itemBuilder: (BuildContext context, int index) {
              return ItemTask(
                isLast: index == 50 - 1,
                task: tasks[index],
              );
            },
          );
        } else {
          return Placeholder();
        }
      },
    );
  }

}

class ItemTask extends StatelessWidget {
  final double bottom;
  final bool isLast;
  final Task task;

  const ItemTask({Key key, this.bottom, this.isLast, this.task})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      margin: EdgeInsets.only(bottom: isLast ? (64 + 46) / 2 : 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.0),
        ),
        border: Border.all(
          color: AppColors.picton_blue,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 13 * 0.24),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      width: 12.0,
                      height: 12.0,
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              task.title,
                              style: TextStyle(
                                color: AppColors.dodger_blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              task.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 13.0),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 45.0,
            height: 45.0,
            child: Image.network(
              "https://avatars0.githubusercontent.com/u/1609975?s=280&v=4",
              fit: BoxFit.contain,
            ),
          )
        ],
      ),
    );
  }
}
