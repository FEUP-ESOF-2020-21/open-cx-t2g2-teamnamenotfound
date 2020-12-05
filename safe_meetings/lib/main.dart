import 'package:flutter/material.dart';
import 'package:safe_meetings/screens/home.dart';
import 'package:safe_meetings/screens/loading.dart';
import 'package:safe_meetings/screens/search_menu.dart';
import 'package:safe_meetings/screens/see_info.dart';
import 'package:safe_meetings/screens/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:safe_meetings/screens/sign_out.dart';

import 'screens/loading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SafeMeetings(SignInApp(), SignOutApp()));
}

class SafeMeetings extends StatelessWidget {
  SignIn signIn;
  SignOut signOut;

  SafeMeetings(SignIn signIn, SignOut signOut) {
    this.signIn = signIn;
    this.signOut = signOut;
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safe Meetings',
      theme: ThemeData(
        primarySwatch: Colors.green, // tema da nossa app
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: signIn,
      routes: {
        '/loading': (context) => Loading(),
        '/home': (context) => Home(),
        '/see_info': (context) => SeeInfo(),
        '/sign_in': (context) => this.signIn,
        '/sign_out': (context) => this.signOut,
        '/search_menu': (context) => SearchMenu(),
      },
    );
  }
}
