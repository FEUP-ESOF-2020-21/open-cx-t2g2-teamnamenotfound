import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:safe_meetings/Conference.dart';
import 'package:safe_meetings/database.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void loadConferences() async {
    List<Conference> conferences = await getConferences();

    // substitui o loading pelo home screen passando a info das conferences
    Navigator.pushReplacementNamed(context, '/home', arguments: conferences);
  }

  @override
  void initState() {
    super.initState();
    this.loadConferences();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[50],
      child: Center(
        child:  SpinKitCubeGrid(
          color: Colors.green,
          size: 50.0,
        ),
      ),
    );
  }
}
