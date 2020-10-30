import 'package:flutter/material.dart';
import 'package:safe_meetings/screens/home.dart';
import 'package:safe_meetings/screens/loading.dart';
import 'package:safe_meetings/screens/see_info.dart';

void main() {
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
      home: Loading(),
      routes: {
        '/loading': (context) => Loading(),
        '/home': (context) => Home(),
        '/see_info': (context) => SeeInfo(),
        // faltam os outros
      },
    );
  }
}
