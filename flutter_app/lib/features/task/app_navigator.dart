import 'package:core_app/core_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/task/task_detail_screen.dart';
import 'package:flutter_app/features/task/task_list_screen.dart';

class AppNavigator extends StatelessWidget {

  final GlobalKey<NavigatorState> navigatorKey;

  const AppNavigator({Key key, this.navigatorKey}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: Routes.task_list,
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case Routes.task_list:
            builder = (BuildContext _) => Injector.get<TaskListScreen>();
            break;

          case Routes.task_detail:
            builder = (BuildContext _) => Injector.get<TaskDetailScreen>();
            break;

          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
