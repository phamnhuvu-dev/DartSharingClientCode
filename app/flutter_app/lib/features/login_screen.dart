import 'package:flutter/material.dart';
import 'package:flutter_app/features/bloc_provider.dart';
import 'package:app/app.dart';

class LoginScreen extends StatefulWidget {
  final LoginBloc loginBloc;

  const LoginScreen({Key key, @required this.loginBloc}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      bloc: widget.loginBloc,
      child: Scaffold(
        body: SafeArea(
          child: body(),
        ),
      ),
    );
  }

  Widget body() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          textFormField(hintText: "Tên tài khoản/Địa chỉ Email"),
          textFormField(hintText: "Mật khẩu"),
          RaisedButton(
            child: Text("LOG IN"),
            onPressed: () {},
          ),
          RaisedButton(
            child: Text("SIGN UP"),
            onPressed: () => Navigator.pushNamed(context, Routes.register),
          ),
        ],
      ),
    );
  }

  Widget textFormField({String hintText = ""}) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
