import 'package:flutter/material.dart';
import 'package:safe_meetings/screens/home.dart';
import 'package:safe_meetings/screens/loading.dart';
import 'package:safe_meetings/screens/search_menu.dart';
import 'package:safe_meetings/screens/see_info.dart';
import 'package:safe_meetings/screens/sign_in.dart';
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
      home: Loading(false),
      routes: {
        '/loading': (context) => Loading(true),
        '/home': (context) => Home(),
        '/see_info': (context) => SeeInfo(),
        '/sign_in': (context) => SignIn(),
        '/search_menu': (context) => SearchMenu(),
        // faltam os outros
      },
    );
  }
}
