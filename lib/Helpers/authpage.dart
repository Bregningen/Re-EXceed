import 'package:flutter/material.dart';
import 'package:rexceed/sider/sign-in.dart';
import '../sider/sign-up.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  _AuthPageState createState() => _AuthPageState();
}

bool isLogin = false;

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) => isLogin
      ? SignIn(
          onClickedSignUp: toggle,
        )
      : SignUp(onClickedSignUp: toggle);
  void toggle() => setState(() {
        isLogin = false;
      });
}
