import 'package:flutter/material.dart';
import 'package:app/app.dart';
import 'package:flutter_app/widgets/buttons/button_theme.dart';
import 'package:flutter_app/widgets/buttons/rect_button.dart';
import 'package:flutter_app/widgets/scaffold/gradient_scaffold.dart';
import 'package:flutter_app/widgets/oval_head_card.dart';
import 'package:flutter_app/widgets/helper/scrollable_content_center.dart';
import 'package:flutter_app/widgets/textfield/rect_textfield.dart';

class RegisterScreen extends StatefulWidget {
  final RegisterBloc registerBloc;

  const RegisterScreen({Key key, @required this.registerBloc})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  ScrollableContentCenter centerContentHelper = ScrollableContentCenter();

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: body(),
    );
  }

  Widget body() {
    WidgetsBinding.instance.addPostFrameCallback((value) {
      centerContentHelper.execute(this);
    });
    return SingleChildScrollView(
      key: centerContentHelper.bodyKey,
      child: Padding(
        padding: EdgeInsets.only(
            top: centerContentHelper.top, left: 30.0, right: 30.0),
        child: Column(
          key: centerContentHelper.contentKey,
          children: <Widget>[
            OvalHeadCard(
              title: "Register",
              top: 20.0,
              child: Column(
                children: <Widget>[
                  textfield(hintText: "Name"),
                  textfield(hintText: "Username"),
                  textfield(hintText: "Email"),
                  textfield(hintText: "Password"),
                  textfield(hintText: "Confirm password"),
                  RectButton(
                    text: "Register",
                    theme: DodgerBlueButtonTheme(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textfield({String hintText}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: RectTextField(
        hintText: hintText,
      ),
    );
  }
}
