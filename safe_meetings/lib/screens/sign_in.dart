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
        alignment: Alignment.center,
        color: Colors.green[50],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlineButton.icon(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              onPressed: () async {
                await auth.googleSignIn();
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

class SignOut extends StatefulWidget {
  @override
  _SignOutState createState() => _SignOutState();
}

class _SignOutState extends State<SignOut> {
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
              onPressed: () async {
                await auth.googleSignOut();
                Navigator.pushReplacementNamed(context, '/sign_in');
              },
              shape: new RoundedRectangleBorder(
                  side: BorderSide(width: 1, style: BorderStyle.solid),
                  borderRadius: new BorderRadius.circular(5.0)),
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  auth.getCurrentUser().photoURL,
                  height: 50.0,
                  width: 50.0,
                  fit: BoxFit.fill,
                ),
              ),
              label: Text('Sign out',
                  style: TextStyle(color: Colors.green[900], fontSize: 20)),
            ),
            //Text(auth.getCurrentUser().displayName),
            //Text(auth.getFirebaseInstance().currentUser.email)
          ],
        ),
      ),
    );
  }
}
