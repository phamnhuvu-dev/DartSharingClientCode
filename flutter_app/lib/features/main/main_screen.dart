import 'dart:io';

import 'package:core_app/core_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/about/about_screen.dart';
import 'package:flutter_app/features/task/app_navigator.dart';
import 'package:flutter_app/modules/device_info.dart';
import 'package:flutter_app/widgets/bottom_bar/bottom_bar.dart';
import 'package:flutter_app/widgets/bottom_bar/bottom_bar_item.dart';
import 'package:flutter_app/widgets/scaffold/white_scaffold.dart';
import 'package:rxdart/subjects.dart';

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
  BehaviorSubject<int> currentIndexSubject;

  List<Widget> screens;
  GlobalKey<NavigatorState> taskKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    currentIndexSubject = BehaviorSubject(seedValue: 0);
    screens = <Widget>[
      AppNavigator(
        navigatorKey: taskKey,
      ),
      Injector.get<AboutScreen>(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WhiteScaffold(
      resizeToAvoidBottomPadding: false,
      child: body(),
    );
  }

  Widget body() {
    final deviceInfo = DeviceInfo.of(context);
    double paddingBottom = deviceInfo.bottomBarHeight / 2;
    if (Platform.isIOS && deviceInfo.isIPhoneX) {
      paddingBottom += deviceInfo.edgeHeight;
    }
    return WillPopScope(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: paddingBottom),
              child: StreamBuilder(
                stream: currentIndexSubject.stream,
                builder: (context, AsyncSnapshot<int> snapshot) {
                  final children = screens
                      .map((screen) => buildOffStageNavigator(screen))
                      .toList();
                  if (snapshot.connectionState == ConnectionState.active) {
                    return Stack(
                      children: children,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            buildBottomBar(),
          ],
        ),
        onWillPop: () async {
          print("Pop");
          final currentIndex = currentIndexSubject.value;
          if (currentIndex == 0) {
            return !await (screens[currentIndex] as AppNavigator)
                .navigatorKey
                .currentState
                .maybePop();
          } else {
            return true;
          }
        });
  }

  Widget buildBottomBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: BottomBar(
        onTap: (index) {
          currentIndexSubject.add(index);
        },
        children: <BottomBarItem>[
          BottomBarItem(title: "Task", icon: Icon(Icons.assignment)),
          BottomBarItem(title: "About", icon: Icon(Icons.person)),
        ],
      ),
    );
  }

  Widget buildOffStageNavigator(Widget child) {
    print(screens.indexOf(child));
    final childIndex = screens.indexOf(child);
    final currentIndex = currentIndexSubject.value;
    return Offstage(
      offstage: childIndex != currentIndex,
      child: child,
    );
  }

  @override
  void dispose() {
    currentIndexSubject.close();
    super.dispose();
  }
}
