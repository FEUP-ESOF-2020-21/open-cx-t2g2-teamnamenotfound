import 'package:flutter/material.dart';
import 'package:safe_meetings/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Authentication auth = Authentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton.icon(
                onPressed: () async {
                  await auth.googleSignIn();
                },
                icon: Image.asset('images/google/google_logo.png'),
                label: Text('Sign in with Google')),
          ],
        ),
      ),
    );
  }
}
