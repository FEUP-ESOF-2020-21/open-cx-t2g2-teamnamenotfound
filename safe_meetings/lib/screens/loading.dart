import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:safe_meetings/objects/conference.dart';
import 'package:safe_meetings/auxiliar/database.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool refreshing;

  void loadConferences() async {
    List<Conference> conferences = await getConferencesFromDatabase();

    // so usado para testes
    if(this.refreshing == null) this.refreshing = false;

    // substitui o loading pelo home screen passando a info das conferences
    if (!this.refreshing)
      Navigator.pushReplacementNamed(context, '/home', arguments: conferences);
    else
      Navigator.pop(context, {'conferences': conferences});
  }

  @override
  void initState() {
    super.initState();
    this.loadConferences();
  }

  @override
  Widget build(BuildContext context) {
    this.refreshing = ModalRoute.of(context).settings.arguments;

    return Container(
      color: Colors.green[50],
      child: Center(
        child: SpinKitCubeGrid(
          color: Colors.green[800],
          size: 50.0,
        ),
      ),
    );
  }
}
