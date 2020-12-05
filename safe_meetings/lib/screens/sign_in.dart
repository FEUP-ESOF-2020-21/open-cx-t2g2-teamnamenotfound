import 'package:flutter/material.dart';
import 'package:safe_meetings/auxiliar/auth.dart';

// ###########################
//          INTERFACE
// ###########################

abstract class SignIn extends StatefulWidget{}

// ###########################
//      IMPLEMENTATION
// ###########################

class SignInApp extends StatefulWidget implements SignIn {
  @override
  _SignInAppState createState() => _SignInAppState();
}

class _SignInAppState extends State<SignInApp> {
  Authentication auth = Authentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.green[50],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlineButton.icon(
              key: const Key("conference1"),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              onPressed: () async {
                await auth.googleSignIn();
                print("aqui");
                Navigator.pushReplacementNamed(context, '/loading',
                    arguments: false);
              },
              icon: Image.asset('images/google/google_logo.png'),
              label: Text('Sign in with Google',
                  style: TextStyle(color: Colors.green[900], fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }
}

// #######################
//      Mock to SignIn
// #######################

class SignInMock extends StatefulWidget implements SignIn {
  @override
  _SignInMockState createState() => _SignInMockState();
}

class _SignInMockState extends State<SignInMock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.green[50],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlineButton.icon(
              key: const Key("login"),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              onPressed: () async {
                Navigator.pushReplacementNamed(context, '/loading',
                    arguments: false);
              },
              icon: Image.asset('images/google/google_logo.png'),
              label: Text('Sign in with Google',
                  style: TextStyle(color: Colors.green[900], fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }
}
