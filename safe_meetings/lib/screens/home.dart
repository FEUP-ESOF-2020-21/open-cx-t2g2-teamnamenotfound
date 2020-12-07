import 'package:flutter/material.dart';
import 'package:safe_meetings/objects/conference.dart';
import 'package:safe_meetings/auxiliar/date_time.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
List<Conference> conferences = [];
class _HomeState extends State<Home> {
  bool start = true;

  // Filters
  String titleFilter = "";
  String localFilter = "";
  int hygienFilter = 0;
  int interestFilter = 0;
  int securityFilter = 0;
  int startDate = 0;
  int endDate = -1;

  bool filterReset = true;

  bool signedIn = false;

  void changeFilters(dynamic filters) {
    setState(() {
      this.titleFilter = filters['titleFilter'];
      this.localFilter = filters['localFilter'];
      this.hygienFilter = filters['hygienFilter'];
      this.interestFilter = filters['interestFilter'];
      this.securityFilter = filters['securityFilter'];
      this.startDate = parseDateToInt(filters['startDate']);
      this.endDate = parseDateToInt(filters['endDate']);

      if (this.titleFilter != "" ||
          this.localFilter != "" ||
          this.hygienFilter != 0 ||
          this.interestFilter != 0 ||
          this.securityFilter != 0 ||
          this.startDate != 0 ||
          this.endDate != -1)
        this.filterReset = false;
      else
        this.filterReset = true;
    });
  }

  void resetFilters() {
    this.titleFilter = "";
    this.localFilter = "";
    this.hygienFilter = 0;
    this.interestFilter = 0;
    this.securityFilter = 0;
    this.startDate = 0;
    this.endDate = -1;

    this.filterReset = true;
  }

  List<Widget> showConfs() {
    List<Widget> confs = [];

    for (int i = 0; i < conferences.length; i++) {
      if ((conferences[i].getName() == this.titleFilter ||
              this.titleFilter == "" ||
              conferences[i]
                  .getName()
                  .toLowerCase()
                  .contains(this.titleFilter.toLowerCase())) &&
          (conferences[i].getLocal() == this.localFilter ||
              this.localFilter == "" ||
              conferences[i]
                  .getLocal()
                  .toLowerCase()
                  .contains(this.localFilter.toLowerCase())) &&
          conferences[i].getHygien() >= this.hygienFilter &&
          conferences[i].getSecurity() >= this.securityFilter &&
          conferences[i].getInterest() >= this.interestFilter &&
          parseDateToInt(conferences[i].getDate()) >= this.startDate &&
          (this.endDate == -1 || this.endDate >= parseDateToInt(conferences[i].getDate()))) {
        confs.add(
          FlatButton(
            key: Key("conference${i+1}Button"),
            onPressed: () {
              Navigator.pushNamed(context, '/see_info',
                  arguments: conferences[i]);
            },
            child: Center(
                child: Text(
              conferences[i].getName(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            )),
            color: Colors.green[300],
          ),
        );
      }
    }

    return confs;
  }

  void updateConferences(dynamic updatedConferences) {
    setState(() {
      conferences = updatedConferences['conferences'];
    });
  }

  Widget filtersButton() {
    if (!this.filterReset)
      return ElevatedButton(
          onPressed: () {
            setState(() {
              this.resetFilters();
            });
          },
          child: Text("Reset Filters"));
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    if (this.start) {
      this.start = false;

      // gets the conferences passes by the loading screen
      conferences = ModalRoute.of(context).settings.arguments;
    }

    return Scaffold(
      appBar: AppBar(
        title:
            Text('Safe Meetings', style: TextStyle(color: Colors.green[800])),
        backgroundColor: Colors.green[50],
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            color: Colors.green[800],
            onPressed: () async {
              dynamic updatedConferences = await Navigator.pushNamed(
                  context, '/loading',
                  arguments: true);
              if (updatedConferences != null)
                this.updateConferences(updatedConferences);
            },
          ),
          IconButton(
            key: const Key("searchButton"),
              icon: Icon(Icons.search),
              color: Colors.green[800],
              onPressed: () async {
                dynamic filters =
                    await Navigator.pushNamed(context, '/search_menu');
                if (filters != null) this.changeFilters(filters);
                // SearchMenu(this.changeFilters);
              } // it should open the search menu
              )
        ],
      ),
      bottomNavigationBar: loginButton(context),
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

Widget loginButton(BuildContext context) {
  //Authentication auth = Authentication();

  return BottomAppBar(
    color: Colors.green[50],
    child: Row(
      children: [
        MaterialButton(
          key: const Key("evaluateButton"),
            onPressed: () {
              Navigator.pushNamed(context, '/participant', arguments: conferences);
            },
            child: Text('Evaluate Conferences',
                style: TextStyle(color: Colors.green[800], fontSize: 18)))
      ],
    ),
  );
}
