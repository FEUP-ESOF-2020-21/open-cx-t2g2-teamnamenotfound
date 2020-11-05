import 'package:flutter/material.dart';
import 'package:safe_meetings/conference.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Conference> conferences = [];

  // Filters
  String title = "";
  int hygien_filter = 0;
  int interest_filter = 0;
  int security_filter = 0;

  // void changeFilters(int hygien, int interest, int security) {
  //   setState(() {
  //     this.hygien_filter = hygien;
  //     this.interest_filter = interest;
  //     this.security_filter = security;
  //   });
  // }

  List<Widget> showConfs() {
    List<Widget> confs = [];

    for (int i = 0; i < conferences.length; i++) {
      if (conferences[i].getHygien() >= this.hygien_filter &&
          conferences[i].getSecurity() >= this.security_filter &&
          conferences[i].getInterest() >= this.interest_filter &&
          (conferences[i].getName() == this.title || this.title == "")) {
        confs.add(
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/see_info',
                  arguments: conferences[i]);
            },
            child: Center(child: Text(conferences[i].getName())),
            color: Colors.grey[200],
          ),
        );
      }
    }

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
      bottomNavigationBar: BottomAppBar(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/sign_in',
                );
              },
              child: Text('Sign in to join conferences',
                  style: TextStyle(color: Colors.black, fontSize: 15)))
        ],
      )),
      backgroundColor: Colors.green[100],
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
