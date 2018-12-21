import 'package:flutter/material.dart';
import 'package:flutter_app/features/todo/todo_list_screen.dart';
import 'package:flutter_app/widgets/bottom_bar.dart';
import 'package:flutter_app/widgets/buttons/add_button.dart';
import 'package:flutter_app/widgets/scaffold/white_scaffold.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return WhiteScaffold(
      child: body(),
    );
  }

  Widget body() {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 64.0 / 2),
          child: TodoListScreen(),
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
        onTap: () {},
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
