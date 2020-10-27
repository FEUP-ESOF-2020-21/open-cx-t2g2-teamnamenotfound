import 'package:flutter/material.dart';
import 'package:safe_meetings/screens/home.dart';
import 'package:safe_meetings/screens/see_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SeeInfo(),
    );
  }
}
