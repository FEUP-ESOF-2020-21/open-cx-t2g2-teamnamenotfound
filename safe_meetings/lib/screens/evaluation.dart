import 'package:flutter/material.dart';
import 'package:safe_meetings/conference.dart';

class Evaluation extends StatefulWidget {
  @override
  _EvalState createState() => _EvalState();
}
class _EvalState extends State<Evaluation> {
  Conference conference;

  int hygieneEvaluate = 3;
  int securityEvaluate = 3;
  int interestEvaluate = 3;

  var color = Colors.green[900];


  Widget displayHygieneEvaluate() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Text("Hygiene",
            style: TextStyle(
              fontSize: 20,
              color: color,
            )),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Row(
            children: [
              Radio(
                  value: 1,
                  groupValue: this.hygieneEvaluate,
                  onChanged: (val) {
                    setState(() {
                      this.hygieneEvaluate = val;
                    });
                  }),
              Text('1',
                  style: TextStyle(
                    color: color,
                  )),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 2,
                  groupValue: this.hygieneEvaluate,
                  onChanged: (val) {
                    setState(() {
                      this.hygieneEvaluate = val;
                    });
                  }),
              Text('2',
                  style: TextStyle(
                    color: color,
                  )),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 3,
                  groupValue: this.hygieneEvaluate,
                  onChanged: (val) {
                    setState(() {
                      this.hygieneEvaluate = val;
                    });
                  }),
              Text('3',
                  style: TextStyle(
                    color: color,
                  )),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 4,
                  groupValue: this.hygieneEvaluate,
                  onChanged: (val) {
                    setState(() {
                      this.hygieneEvaluate = val;
                    });
                  }),
              Text('4',
                  style: TextStyle(
                    color: color,
                  )),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 5,
                  groupValue: this.hygieneEvaluate,
                  onChanged: (val) {
                    setState(() {
                      this.hygieneEvaluate = val;
                    });
                  }),
              Text('5',
                  style: TextStyle(
                    color: color,
                  )),
            ],
          )
        ])
      ]),
    );
  }

  Widget displaySecurityEvaluate() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Text("Security",
            style: TextStyle(
              fontSize: 20,
              color: color,
            )),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Row(
            children: [
              Radio(
                  value: 1,
                  groupValue: this.securityEvaluate,
                  onChanged: (val) {
                    setState(() {
                      this.securityEvaluate = val;
                    });
                  }),
              Text('1',
                  style: TextStyle(
                    color: color,
                  )),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 2,
                  groupValue: this.securityEvaluate,
                  onChanged: (val) {
                    setState(() {
                      this.securityEvaluate = val;
                    });
                  }),
              Text('2',
                  style: TextStyle(
                    color: color,
                  )),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 3,
                  groupValue: this.securityEvaluate,
                  onChanged: (val) {
                    setState(() {
                      this.securityEvaluate = val;
                    });
                  }),
              Text('3',
                  style: TextStyle(
                    color: color,
                  )),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 4,
                  groupValue: this.securityEvaluate,
                  onChanged: (val) {
                    setState(() {
                      this.securityEvaluate = val;
                    });
                  }),
              Text('4',
                  style: TextStyle(
                    color: color,
                  )),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 5,
                  groupValue: this.securityEvaluate,
                  onChanged: (val) {
                    setState(() {
                      this.securityEvaluate = val;
                    });
                  }),
              Text('5',
                  style: TextStyle(
                    color: color,
                  )),
            ],
          )
        ])
      ]),
    );
  }

  Widget displayInterestEvaluate() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Text("Interest",
            style: TextStyle(
              fontSize: 20,
              color: color,
            )),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Row(
            children: [
              Radio(
                  value: 1,
                  groupValue: this.interestEvaluate,
                  onChanged: (val) {
                    setState(() {
                      this.interestEvaluate = val;
                    });
                  }),
              Text('1',
                  style: TextStyle(
                    color: color,
                  )),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 2,
                  groupValue: this.interestEvaluate,
                  onChanged: (val) {
                    setState(() {
                      this.interestEvaluate = val;
                    });
                  }),
              Text('2',
                  style: TextStyle(
                    color: color,
                  )),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 3,
                  groupValue: this.interestEvaluate,
                  onChanged: (val) {
                    setState(() {
                      this.interestEvaluate = val;
                    });
                  }),
              Text('3',
                  style: TextStyle(
                    color: color,
                  )),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 4,
                  groupValue: this.interestEvaluate,
                  onChanged: (val) {
                    setState(() {
                      this.interestEvaluate = val;
                    });
                  }),
              Text('4',
                  style: TextStyle(
                    color: color,
                  )),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 5,
                  groupValue: this.interestEvaluate,
                  onChanged: (val) {
                    setState(() {
                      this.interestEvaluate = val;
                    });
                  }),
              Text('5',
                  style: TextStyle(
                    color: color,
                  )),
            ],
          )
        ])
      ]),
    );
  }

  Widget displayFilterButton() {
    return RaisedButton(
        color: Colors.green[300],
        onPressed: () {
          conference.setEvaluation(this.hygieneEvaluate, this.securityEvaluate, this.interestEvaluate);
          //colocar para ir para a pagina do participante
          Navigator.pop(context, '/evaluation');
          Navigator.pop(context, '/insert_code');
          Navigator.pop(context, '/participant');

        },
        child: Text('Submit',
          style: TextStyle(
            fontSize: 16, color: Colors.white
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    conference=ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title:
            Text('Safe Meetings', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[300],
          // automaticallyImplyLeading:
          //     false, // this way the back button isn't displayed
        ),
        backgroundColor: Colors.white,
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
                this.displayHygieneEvaluate(),
                this.displaySecurityEvaluate(),
                this.displayInterestEvaluate(),
                this.displayFilterButton(),
              ]),
            ]),
          )
        ]));
  }
}