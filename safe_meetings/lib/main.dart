import 'package:flutter/material.dart';
import 'package:safe_meetings/screens/home.dart';
import 'package:safe_meetings/screens/loading.dart';
import 'package:safe_meetings/screens/search_menu.dart';
import 'package:safe_meetings/screens/see_info.dart';
import 'package:safe_meetings/screens/sign_in.dart';
import 'package:safe_meetings/screens/evaluation.dart';
import 'package:safe_meetings/screens/insert_code.dart';
import 'package:safe_meetings/screens/participant.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SafeMeetings());
}

class SafeMeetings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safe Meetings',
      theme: ThemeData(
        primarySwatch: Colors.green, // tema da nossa app
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignIn(),
      routes: {
        '/loading': (context) => Loading(),
        '/home': (context) => Home(),
        '/see_info': (context) => SeeInfo(),
        '/sign_in': (context) => SignIn(),
        '/sign_out': (context) => SignOut(),
        '/search_menu': (context) => SearchMenu(),
        '/evaluation':(context) => Evaluation(),
        '/insert_code': (context) => InsertCode(),
        '/participant': (context) => Participant(),
        // faltam os outros
      },
    );
  }
}
