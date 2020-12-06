import 'package:flutter/material.dart';
import 'package:safe_meetings/conference.dart';
import 'package:safe_meetings/auth.dart';

class SeeInfo extends StatefulWidget {
  @override
  _SeeInfoState createState() => _SeeInfoState();
}

class _SeeInfoState extends State<SeeInfo> {
  Conference conference;
  Authentication auth = Authentication();

  var color;

  void selectStarColor(int val) {
    if (val == 5)
      color = Colors.green[600];
    else if (val >= 2 && val <= 4)
      color = Colors.yellow[600];
    else
      color = Colors.red[600];
  }

  Widget nameWidget() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Text(conference.getName(),
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.green[900]
              )),
        ]),
      ),
    );
  }

  Widget descriptionWidget() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 350,
              child: Text(conference.getDescription(),
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.green[900]
                  )),
            ),
          ),
        ]),
      ),
    );
  }

  Widget datewidget() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: [
          Text("Date: ",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.green[900]
              )),
          Text(conference.getDate(),
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.green[900]
              )),
        ]),
      ),
    );
  }

  Widget hourwidget() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: [
          Text("Hour: ",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.green[900]
              )),
          Text(conference.getHour(),
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.green[900]
              )),
        ]),
      ),
    );
  }

  Widget localWidget() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: [
          Text("Local: ",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.green[900]
              )),
          Text(conference.getLocal(),
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.green[900]
              )),
        ]),
      ),
    );
  }

  Widget hygienWidget() {
    this.selectStarColor(conference.getHygien());
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(children: [
            Text("Hygien: ",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.green[900]
                )),
            for (int i = 0; i < conference.getHygien(); i++)
              Icon(Icons.star, color: this.color),
          ]),
        ));
  }

  Widget securityWidget() {
    this.selectStarColor(conference.getSecurity());
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(children: [
            Text("Security: ",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.green[900]
                )),
            for (int i = 0; i < conference.getSecurity(); i++)
              Icon(Icons.star, color: this.color),
          ]),
        ));
  }

  Widget interestWidget() {
    this.selectStarColor(conference.getInterest());
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(children: [
            Text("Interest: ",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.green[900]
                )),
            for (int i = 0; i < conference.getInterest(); i++)
              Icon(Icons.star, color: this.color),
          ]),
        ));
  }

  Widget codeWidget() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: [
          Text("Code to Evaluate: ",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.green[900]
              )),
          Text(conference.getCode(),
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.green[900]
              )),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // gets the conferences passes by the loading screen
    conference = ModalRoute
        .of(context)
        .settings
        .arguments;
    String usermail = auth.getCurrentUser().email;
    if (conference.isOrganizer(usermail)) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[300],
            title: Text(
              'Safe Meetings', /*style: TextStyle(color: Colors.green[800]),*/),
          ),
          backgroundColor: Colors.white,
          body: ListView(padding: const EdgeInsets.all(8.0), children: [
            Container(
              child: Column(
                children: [
                  this.nameWidget(),
                  this.descriptionWidget(),
                  this.datewidget(),
                  this.hourwidget(),
                  this.localWidget(),
                  this.hygienWidget(),
                  this.securityWidget(),
                  this.interestWidget(),
                  this.codeWidget(),
                ],
              ),
            )
          ]
          ));
    }
    else {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[300],
            title: Text(
              'Safe Meetings', /*style: TextStyle(color: Colors.green[800]),*/),
          ),
          backgroundColor: Colors.white,
          body: ListView(padding: const EdgeInsets.all(8.0), children: [
            Container(
              child: Column(
                children: [
                  this.nameWidget(),
                  this.descriptionWidget(),
                  this.datewidget(),
                  this.hourwidget(),
                  this.localWidget(),
                  this.hygienWidget(),
                  this.securityWidget(),
                  this.interestWidget(),
                ],
              ),
            )
          ]
          ));
    }
  }
}