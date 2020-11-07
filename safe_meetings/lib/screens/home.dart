import 'package:flutter/material.dart';
import 'package:safe_meetings/conference.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Conference> conferences = [];

  // Filters
  String titleFilter = "";
  int hygienFilter = 0;
  int interestFilter = 0;
  int securityFilter = 0;

  bool filterReset = true;

  void changeFilters(dynamic filters) {
    setState(() {
      this.titleFilter = filters['titleFilter'];
      this.hygienFilter = filters['hygienFilter'];
      this.interestFilter = filters['interestFilter'];
      this.securityFilter = filters['securityFilter'];

      if(this.titleFilter != "" || this.hygienFilter != 0 || this.interestFilter != 0 || this.securityFilter != 0)
        this.filterReset = false;
      else  
        this.filterReset = true;
    });
  }

  void resetFilters() {
    this.titleFilter = "";
    this.hygienFilter = 0;
    this.interestFilter = 0;
    this.securityFilter = 0;

    this.filterReset = true;
  }

  List<Widget> showConfs() {
    List<Widget> confs = [];

    for (int i = 0; i < conferences.length; i++) {
      if (conferences[i].getHygien() >= this.hygienFilter &&
          conferences[i].getSecurity() >= this.securityFilter &&
          conferences[i].getInterest() >= this.interestFilter &&
          (conferences[i].getName() == this.titleFilter || this.titleFilter == "")) {
        confs.add(
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/see_info',
                  arguments: conferences[i]);
            },
            child: Center(
                child: Text(conferences[i].getName(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400))),
            color: Colors.green[300],
          ),
        );
      }
    }

    return confs;
  }

  Widget filtersButton() {
    if(!this.filterReset)
      return ElevatedButton(onPressed: () {
        setState(() {
          this.resetFilters();
        });
      }, child: Text("Reset Filters"));
    else 
      return null;
  }

  @override
  Widget build(BuildContext context) {
    // gets the conferences passes by the loading screen
    conferences = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title:
            Text('Safe Meetings', style: TextStyle(color: Colors.green[800])),
        backgroundColor: Colors.green[50],
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            color: Colors.green[800],
            onPressed: () {}, // it should refresh the home screen
          ),
          IconButton(
              icon: Icon(Icons.search),
              color: Colors.green[800],
              onPressed: () async {
                dynamic filters = await Navigator.pushNamed(context, '/search_menu');
                this.changeFilters(filters);
                // SearchMenu(this.changeFilters);
              } // it should open the search menu
              )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.green[50],
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
                      style: TextStyle(color: Colors.green[900], fontSize: 16)))
            ],
          )),
      backgroundColor: Colors.white,
      body: GridView.count(
        padding: EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: this.showConfs(),
      ),
      floatingActionButton: this.filtersButton(),
    );
  }
}
