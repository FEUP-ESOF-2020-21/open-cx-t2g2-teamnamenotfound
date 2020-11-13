import 'package:flutter/material.dart';

class SearchMenu extends StatefulWidget {
  @override
  _SearchMenuState createState() => _SearchMenuState();
}

class _SearchMenuState extends State<SearchMenu> {
  String titleFilter = "";

  int hygienFilter = 0;
  int securityFilter = 0;
  int interestFilter = 0;

  var color = Colors.green[900];

  Widget displayTitleForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("Title (empty = no filter)",
              style: TextStyle(fontSize: 20, color: color)),
          TextField(
            decoration: InputDecoration(
              hintText: 'title',
              focusColor: Colors.white,
            ),
            onChanged: (value) {
              setState(() {
                this.titleFilter = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget displayHygienFilter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Text("Hygien (0 = no filter)",
            style: TextStyle(
              fontSize: 20,
              color: color,
            )),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            children: [
              Radio(
                  value: 0,
                  groupValue: this.hygienFilter,
                  onChanged: (val) {
                    setState(() {
                      this.hygienFilter = val;
                    });
                  }),
              Text('0',
                  style: TextStyle(
                    color: color,
                  )),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 1,
                  groupValue: this.hygienFilter,
                  onChanged: (val) {
                    setState(() {
                      this.hygienFilter = val;
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
                  groupValue: this.hygienFilter,
                  onChanged: (val) {
                    setState(() {
                      this.hygienFilter = val;
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
                  groupValue: this.hygienFilter,
                  onChanged: (val) {
                    setState(() {
                      this.hygienFilter = val;
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
                  groupValue: this.hygienFilter,
                  onChanged: (val) {
                    setState(() {
                      this.hygienFilter = val;
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
                  groupValue: this.hygienFilter,
                  onChanged: (val) {
                    setState(() {
                      this.hygienFilter = val;
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

  Widget displaySecurityForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Text("Security (0 = no filter)",
            style: TextStyle(
              fontSize: 20,
              color: color,
            )),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            children: [
              Radio(
                  value: 0,
                  groupValue: this.securityFilter,
                  onChanged: (val) {
                    setState(() {
                      this.securityFilter = val;
                    });
                  }),
              Text('0',
                  style: TextStyle(
                    color: color,
                  )),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 1,
                  groupValue: this.securityFilter,
                  onChanged: (val) {
                    setState(() {
                      this.securityFilter = val;
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
                  groupValue: this.securityFilter,
                  onChanged: (val) {
                    setState(() {
                      this.securityFilter = val;
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
                  groupValue: this.securityFilter,
                  onChanged: (val) {
                    setState(() {
                      this.securityFilter = val;
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
                  groupValue: this.securityFilter,
                  onChanged: (val) {
                    setState(() {
                      this.securityFilter = val;
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
                  groupValue: this.securityFilter,
                  onChanged: (val) {
                    setState(() {
                      this.securityFilter = val;
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

  Widget displayInterestForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Text("Interest (0 = no filter)",
            style: TextStyle(
              fontSize: 20,
              color: color,
            )),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            children: [
              Radio(
                  value: 0,
                  groupValue: this.interestFilter,
                  onChanged: (val) {
                    setState(() {
                      this.interestFilter = val;
                    });
                  }),
              Text('0',
                  style: TextStyle(
                    color: color,
                  )),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 1,
                  groupValue: this.interestFilter,
                  onChanged: (val) {
                    setState(() {
                      this.interestFilter = val;
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
                  groupValue: this.interestFilter,
                  onChanged: (val) {
                    setState(() {
                      this.interestFilter = val;
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
                  groupValue: this.interestFilter,
                  onChanged: (val) {
                    setState(() {
                      this.interestFilter = val;
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
                  groupValue: this.interestFilter,
                  onChanged: (val) {
                    setState(() {
                      this.interestFilter = val;
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
                  groupValue: this.interestFilter,
                  onChanged: (val) {
                    setState(() {
                      this.interestFilter = val;
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
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context, {
          'titleFilter': this.titleFilter,
          'hygienFilter': this.hygienFilter,
          'interestFilter': this.interestFilter,
          'securityFilter': this.securityFilter
        });
      },
      child: Text('Filter'),
    );
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
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 5, color: Colors.green))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(
                      child: Text("Choose the filters you want:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: color,
                          )),
                    ),
                  ),
                ),
                this.displayTitleForm(),
                this.displayHygienFilter(),
                this.displaySecurityForm(),
                this.displayInterestForm(),
                this.displayFilterButton(),
              ]),
            ]),
          )
        ]));
  }
}
