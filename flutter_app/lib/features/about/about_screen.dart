import 'package:flutter/material.dart';
import 'package:flutter_app/features/main/main_frame.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    print("Build AboutScreen");
    return MainFrame(
      child: Center(
        child: Text("About"),
      ),
      iconData: Icons.power_settings_new,
      onTapCircleButton: () {
        print("About");
      },
    );
  }

  @override
  void initState() {
    super.initState();
    print("AboutScreen");
  }
}
