import 'package:core_app/core_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';
import 'package:rxdart/subjects.dart';

class TaskItem extends StatefulWidget {
  final double bottom;
  final Task task;
  final isDeleteMode;
  final ValueGetter<void> select;

  const TaskItem(
      {Key key, this.bottom, this.task, this.isDeleteMode = false, this.select})
      : super(key: key);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  BehaviorSubject<void> selectDeleteSubject = BehaviorSubject();

  @override
  Widget build(BuildContext context) {
      return InkWell(
        onTap: () {
          if (widget.isDeleteMode) {
            widget.task.isDeleteSelect = !widget.task.isDeleteSelect;
            print(widget.task.isDeleteSelect);
            selectDeleteSubject.add(null);
          } else {
            widget.select();
          }
        },
        child: buildItem(),
      );
  }

  Widget buildItem() {
    return Container(
      height: 75.0,
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
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
                buildDotAndGroupTitleDescription(),
              ],
            ),
          ),
          buildImage(),
        ],
      ),
    );
  }

  Widget buildDotAndGroupTitleDescription() {
    return Row(
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
            child: buildTitleAndDescription(),
          ),
        )
      ],
    );
  }

  Widget buildTitleAndDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.task.title,
          style: TextStyle(
            color: AppColors.dodger_blue,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        Text(
          widget.task.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 13.0),
        )
      ],
    );
  }

  Widget buildImage() {
    final image = ({bool isDeleteSelect = false}) {
      return Container(
        width: 45.0,
        height: 45.0,
        child: Stack(
          children: <Widget>[
            Image.network(
              "https://avatars0.githubusercontent.com/u/1609975?s=280&v=4",
              fit: BoxFit.contain,
            ),
            isDeleteSelect
                ? Icon(
              Icons.remove_circle_outline,
              color: Colors.red,
              size: 45.0,
            )
                : Container(),
          ],
        ),
      );
    };

    if (widget.isDeleteMode) {
      return StreamBuilder(
        stream: selectDeleteSubject.stream,
        builder: (context, AsyncSnapshot<void> snapshot) {
          print(widget.task.isDeleteSelect);
          return image(isDeleteSelect: widget.task.isDeleteSelect);
        },
      );
    } else {
      return image();
    }
  }

  @override
  void dispose() {
    selectDeleteSubject?.close();
    super.dispose();
  }
}
