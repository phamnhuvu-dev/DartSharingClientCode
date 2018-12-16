import 'package:flutter/material.dart';
import 'package:flutter_app/features/bloc_provider.dart';
import 'package:app/app.dart';
import 'package:flutter_app/widgets/main_background.dart';

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
      child: MainBackground(
        child: body(),
      ),
    );
  }

  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        textField(hintText: "Tên tài khoản/Địa chỉ Email"),
        textField(hintText: "Mật khẩu"),
        RaisedButton(
          child: Text("LOG IN"),
          onPressed: () {},
        ),
        RaisedButton(
          child: Text("SIGN UP"),
          onPressed: () => Navigator.pushNamed(context, Routes.register),
        ),
      ],
    );
//    return Form(
//      key: _formKey,
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          textFormField(hintText: "Tên tài khoản/Địa chỉ Email"),
//          textFormField(hintText: "Mật khẩu"),
//          RaisedButton(
//            child: Text("LOG IN"),
//            onPressed: () {},
//          ),
//          RaisedButton(
//            child: Text("SIGN UP"),
//            onPressed: () => Navigator.pushNamed(context, Routes.register),
//          ),
//        ],
//      ),
//    );
  }

  Widget textField({String hintText = ""}) {
    return TextField(
      decoration: InputDecoration(hintText: hintText),
    );
  }

  Widget textFormField({String hintText = ""}) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
