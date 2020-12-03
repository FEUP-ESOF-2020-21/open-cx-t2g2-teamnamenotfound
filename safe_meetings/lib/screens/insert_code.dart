import 'package:flutter/material.dart';
import 'package:safe_meetings/conference.dart';

class InsertCode extends StatefulWidget {
  @override
  _InsertCodeState createState() => _InsertCodeState();
}

class _InsertCodeState extends State<InsertCode> {
  Conference conference;

  String conference_code = "";

  var color = Colors.green[900];

  Widget displayConferenceCode() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("Insert the code given to you at the Conference:",
              style: TextStyle(fontSize: 20, color: color)),
          TextField(
            decoration: InputDecoration(
              hintText: 'insert the code here',
              focusColor: Colors.white,
            ),
            onChanged: (value) {
              setState(() {
                this.conference_code = value;
                });
               },
            ),
        ],
      ),
    );
  }

  Widget displayButton() {
    return ElevatedButton(
        onPressed: () {
          if(this.conference_code==conference.getCode()){
            Navigator.pushNamed(context, 'evaluation',arguments: conference);
          }
        },
        child: Text('Next',
          style: TextStyle(
            fontSize: 16,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Safe Meetings"),
          // automaticallyImplyLeading:
          //     false, // this way the back button isn't displayed
        ),
        backgroundColor: Colors.green[50],
        body: ListView(padding: const EdgeInsets.all(8.0), children: [
          Container(
            child: Column(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(
                      child: Text("Conference Evaluation",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: color,
                          )),
                    ),
                  ),
                ),
                this.displayConferenceCode(),
                this.displayButton(),
              ]),
            ]),
          )
        ]));
  }
}