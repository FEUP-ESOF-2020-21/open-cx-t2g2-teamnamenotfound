import 'package:flutter/material.dart';
import 'package:safe_meetings/conference.dart';

class SeeInfo extends StatefulWidget {
  @override
  _SeeInfoState createState() => _SeeInfoState();
}

class _SeeInfoState extends State<SeeInfo> {
  Conference conference;

  var color;

  void selectStarColor(int val) {
    if (val == 5)
      color = Colors.green;
    else if (val >= 2 && val <= 4)
      color = Colors.yellow;
    else
      color = Colors.red;
  }

  Widget nameWidget() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: [
          Text("Title: ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          Text(conference.getName(),
              style: TextStyle(
                fontSize: 20,
              )),
        ]),
      ),
    );
  }

  Widget descriptionWidget() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: [
          Text("Description: ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              child: Text(conference.getDescription(),
                  style: TextStyle(
                    fontSize: 20,
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
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )),
          Text(conference.getDate(),
              style: TextStyle(
                fontSize: 20,
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
              fontWeight: FontWeight.bold,
              fontSize: 20,
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
              fontWeight: FontWeight.bold,
              fontSize: 20,
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
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        for (int i = 0; i < conference.getInterest(); i++)
          Icon(Icons.star, color: this.color),
      ]),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // gets the conferences passes by the loading screen
    conference = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Safe Meetings'),
      ),
      backgroundColor: Colors.green[100],
      body: Column(
        children: [
          this.nameWidget(),
          this.descriptionWidget(),
          this.datewidget(),
          this.hygienWidget(),
          this.securityWidget(),
          this.interestWidget(),
        ],
      ),
    );
  }
}
