import 'package:flutter/material.dart';
import 'package:flutter_app/statics/app_colors.dart';
import 'package:flutter_app/widgets/scaffold/white_scaffold.dart';

class TaskListScreen extends StatefulWidget {
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
    return ListView.builder(
      itemCount: 50,
      padding: EdgeInsets.only(left: 24.0, right: 24.0),
      itemBuilder: (BuildContext context, int index) {
        return ItemTask(
          isLast: index == 50 - 1,
        );
      },
    );
  }
}

class ItemTask extends StatelessWidget {
  final double bottom;
  final bool isLast;

  const ItemTask({Key key, this.bottom, this.isLast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.0,
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      margin: EdgeInsets.only(bottom: isLast ? (64 + 46)/2 : 15.0),
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
                              "Title",
                              style: TextStyle(
                                color: AppColors.dodger_blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              "Description - Lorem ipsum dolor sit amet, scripta tibique usu ei Lorem ipsum dolor sit amet…",
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
