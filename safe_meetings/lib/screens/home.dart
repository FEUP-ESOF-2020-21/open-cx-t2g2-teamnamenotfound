import 'package:flutter/material.dart';
import 'package:safe_meetings/Conference.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Conference> conferences = [];
  // int hygien_filter = 0;
  // int interest_filter = 0;
  // int security_filter = 0;

  // void changeFilters(int hygien, int interest, int security) {
  //   setState(() {
  //     this.hygien_filter = hygien;
  //     this.interest_filter = interest;
  //     this.security_filter = security;
  //   });
  // }

  List<Widget> showConfs() {
    List<Widget> confs = [];

    for (int i = 0; i < conferences.length; i++)
      confs.add(
        FlatButton(
          onPressed: () {
            Navigator.pushNamed(context, '/see_info', arguments: conferences[i]);
          },
          child: Center(child: Text(conferences[i].getName())),
          color: Colors.grey[300],
        ),
      );

    return confs;
  }

  @override
  Widget build(BuildContext context) {
    // gets the conferences passes by the loading screen
    conferences = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Safe Meetings'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            color: Colors.white,
            onPressed: () {}, // it should refresh the home screen
          ),
          IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: () {
                // SearchMenu(this.changeFilters);
              } // it should open the search menu
              )
        ],
      ),
      backgroundColor: Colors.green[50],
      body: GridView.count(
        padding: EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: this.showConfs(),
      ),
    );
  }
}
