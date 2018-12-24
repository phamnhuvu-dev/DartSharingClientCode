import 'package:app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/bloc_provider.dart';
import 'package:flutter_app/widgets/buttons/button_theme.dart';
import 'package:flutter_app/widgets/buttons/rect_button.dart';
import 'package:flutter_app/widgets/scaffold/gradient_scaffold.dart';
import 'package:flutter_app/widgets/oval_head_card.dart';
import 'package:flutter_app/widgets/helper/scrollable_content_center.dart';
import 'package:flutter_app/widgets/textfield/rect_textfield.dart';

class LoginScreen extends StatefulWidget {
  final LoginBloc loginBloc;

  const LoginScreen({Key key, @required this.loginBloc}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ScrollableContentCenter _contentCenter = ScrollableContentCenter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      bloc: widget.loginBloc,
      child: GradientScaffold(
        child: body(),
      ),
    );
  }

  Widget body() {
    WidgetsBinding.instance.addPostFrameCallback((value) {
      _contentCenter.execute(this);
    });
    return SingleChildScrollView(
      key: _contentCenter.bodyKey,
      child: Padding(
        padding: EdgeInsets.only(
          top: _contentCenter.top,
          left: 30.0,
          right: 30.0,
        ),
        child: Column(
          key: _contentCenter.contentKey,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OvalHeadCard(
              title: "Login",
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                      bottom: 15.0,
                    ),
                    child: RectTextField(
                      hintText: "Id/Email",
                    ),
                  ),
                  RectTextField(
                    hintText: "Password",
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30.0,
                      bottom: 10.0,
                    ),
                    child: RectButton(
                      text: "Login",
                      theme: DodgerBlueButtonTheme(),
                      onTap: () => Navigator.of(context).pushNamed("/main"),
                    ),
                  ),
                  RectButton(
                    text: "Register",
                    theme: MalibuButtonTheme(),
                    onTap: () =>
                        Navigator.of(context).pushNamed(Routes.register),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
