import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rexceed/main.dart';

class SignIn extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const SignIn({Key? key, required this.onClickedSignUp}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final emailController = TextEditingController();
  final passWordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passWordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          TextField(
              controller: emailController,
              textInputAction: TextInputAction.next,
              decoration:
                  InputDecoration(hintText: 'Email', labelText: 'Email')),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: passWordController,
            textInputAction: TextInputAction.next,
            decoration:
                InputDecoration(hintText: 'Password', labelText: 'Password'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          TextButton(
              onPressed: login,
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 25),
              )),
          RichText(
              text: TextSpan(
                  text: 'Ingen bruger? ',
                  style: const TextStyle(color: Colors.black, fontSize: 25),
                  children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pop(context);
                      },
                    text: 'Opret en',
                    style: const TextStyle(color: Colors.blue, fontSize: 25))
              ]))
        ]),
      ),
    ));
  }

  Future login() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passWordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
