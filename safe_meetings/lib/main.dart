import 'package:flutter/material.dart';
import 'package:safe_meetings/conference.dart';
import 'package:safe_meetings/database.dart';
import 'package:safe_meetings/screens/home.dart';
import 'package:safe_meetings/screens/loading.dart';
import 'package:safe_meetings/screens/see_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  List<Conference> conferences;
  bool _loading = true;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void updateConferences() {
    getConferences().then((value) => {
      this.setState(() {
        widget.conferences = value;
      })
    });
    
    widget._loading = false;

    print(widget.conferences);
  }

  /* void insertConferences() {
    for(int i = 0; i < 5; i++) {
      Conference conference = Conference(
        "Conference $i",
        "fbobufofnobwfneonwudeuboiwebow",
        "23/10/2006",
        [4, 2, 3, 5, 5, 3],
        [4, 5, 3, 5, 4, 1],
        [2, 2, 3, 2, 5, 3]
      );

      updateConference(conference);
    }
  } */
  
  @override
  void initState() {
    super.initState();
    // this.insertConferences();
    this.updateConferences();
    print(widget.conferences);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: widget._loading ? Loading() : Home(),
    );
  }
}
