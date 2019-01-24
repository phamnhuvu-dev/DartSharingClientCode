import 'package:core_app/core_app.dart'
    show Injector, Routes, User, UserGlobalBloc;
import 'package:flutter/material.dart';
import 'package:flutter_app/features/main/main_frame.dart';

class AboutScreen extends StatefulWidget {
  final UserGlobalBloc userGlobalBloc;

  const AboutScreen({Key key, @required this.userGlobalBloc}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  UserGlobalBloc userGlobalBloc;

  @override
  void initState() {
    super.initState();
    userGlobalBloc = widget.userGlobalBloc;
  }

  @override
  Widget build(BuildContext context) {
    return MainFrame(
      child: Center(
        child: StreamBuilder(
          stream: userGlobalBloc.user,
          builder: (context, AsyncSnapshot<User> snapshot) {
            final user = snapshot.data;
            if (user == null) return Container();

            return Column(
              children: <Widget>[
                Text(user.username),
                Text(user.accountName),
                Text(user.email),
              ],
            );
          },
        ),
      ),
      iconData: Icons.power_settings_new,
      onTapCircleButton: () {
        userGlobalBloc.dispose();
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.initial,
          (Route<dynamic> route) => false,
        );
      },
    );
  }
}
