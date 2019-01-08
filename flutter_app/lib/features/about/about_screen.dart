import 'package:flutter/material.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    print("Build AboutScreen");
    return Center(
      child: Text("About"),
    );
  }

  @override
  void initState() {
    super.initState();
    print("AboutScreen");
  }
}
