import 'dart:async';

import 'package:core_app/core_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/buttons/button_theme.dart';
import 'package:flutter_app/widgets/buttons/rect_button.dart';
import 'package:flutter_app/widgets/dialogs/loading_dialog.dart';
import 'package:flutter_app/widgets/helper/scrollable_content_center.dart';
import 'package:flutter_app/widgets/oval_head_card.dart';
import 'package:flutter_app/widgets/scaffold/gradient_scaffold.dart';
import 'package:flutter_app/widgets/textfield/rect_textfield.dart';

class LoginScreen extends StatefulWidget {
  final UserGlobalBloc userGlobalBloc;

  const LoginScreen({
    Key key,
    @required this.userGlobalBloc,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with ScrollableContentCenterHelper {
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  StreamSubscription<User> streamSubscription;

  @override
  void initState() {
    super.initState();
    streamSubscription = widget.userGlobalBloc.user.listen(
      (user) {
        streamSubscription.cancel();
        if (Navigator.pop(context)) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil("/main", (Route<dynamic> route) => false);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      key: bodyKey,
      child: ScrollableContentCenter(
        bodyKey: bodyKey,
        contentKey: contentKey,
        padding: EdgeInsets.only(
          left: 30.0,
          right: 30.0,
        ),
        child: Column(
          key: contentKey,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OvalHeadCard(
              title: "Login",
              child: Column(
                children: <Widget>[
                  streamLogin(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30.0,
                      bottom: 10.0,
                    ),
                    child: RectButton(
                      text: "Login",
                      theme: DodgerBlueButtonTheme(),
                      onTap: () {
                        LoadingDialog.show(
                          context: context,
                          message: "Waiting",
                          onWillPop: widget.userGlobalBloc.cancelRequest,
                        );
                        widget.userGlobalBloc.checkValidLogin(
                          account: accountController.text,
                          password: passwordController.text,
                        );
                      },
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

  Widget streamLogin() {
    return StreamBuilder(
      stream: widget.userGlobalBloc.validLogin,
      builder: (
        BuildContext context,
        AsyncSnapshot<Tuple2<String, String>> snapshot,
      ) {
        if (snapshot.data != null) {}
        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 20.0,
                bottom: 15.0,
              ),
              child: RectTextField(
                controller: accountController,
                hintText: "Id/Email",
              ),
            ),
            RectTextField(
              controller: passwordController,
              hintText: "Password",
            ),
          ],
        );
        ;
      },
    );
  }
}
