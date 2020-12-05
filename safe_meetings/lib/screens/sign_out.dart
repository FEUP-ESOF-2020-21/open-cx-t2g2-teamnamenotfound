import 'package:flutter/material.dart';
import 'package:safe_meetings/auxiliar/auth.dart';

// ###########################
//          INTERFACE
// ###########################

abstract class SignOut extends StatefulWidget{}

// ###########################
//      IMPLEMENTATION
// ###########################

class SignOutApp extends StatefulWidget implements SignOut{
  @override
  _SignOutAppState createState() => _SignOutAppState();
}

class _SignOutAppState extends State<SignOutApp> {
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

// #######################
//      Mock to SignOut
// #######################

class SignOutMock extends StatefulWidget implements SignOut {
  @override
  _SignOutMockState createState() => _SignOutMockState();
}

class _SignOutMockState extends State<SignOutMock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
