import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rexceed/Helpers/appColors.dart';
import 'package:rexceed/main.dart';
import 'package:rexceed/sider/sign-in.dart';

class SignUp extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const SignUp({Key? key, required this.onClickedSignUp}) : super(key: key);

  @override
  State<SignUp> createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
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
              onPressed: SignUp,
              child: const Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 25,
                ),
              )),
          RichText(
              text: TextSpan(
                  text: 'Har du allerede en bruger?  ',
                  style: const TextStyle(color: Colors.black, fontSize: 25),
                  children: [
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(
                                onClickedSignUp: toggle,
                              ),
                            ));
                      },
                    text: 'Log In',
                    style: const TextStyle(color: Colors.blue, fontSize: 25))
              ]))
        ]),
      ),
    ));
  }

  void toggle() => setState(() {
        bool isLogin = false;
      });
  Future SignUp() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passWordController.text.trim());
      final FirebaseAuth _auth = FirebaseAuth.instance;

      //Opretter et dokument til andet
      FirebaseFirestore.instance
          .collection(_auth.currentUser!.uid.toString())
          .doc(('Other'))
          .set({});
      //Opretter et dokument til Træningerne
      FirebaseFirestore.instance
          .collection(_auth.currentUser!.uid.toString())
          .doc(('Training'))
          .set({});
      //Opretter et dokument til parameter
      FirebaseFirestore.instance
          .collection(_auth.currentUser!.uid.toString())
          .doc('Parameters')
          .set({});
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
