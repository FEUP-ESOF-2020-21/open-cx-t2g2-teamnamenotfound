import 'package:flutter/material.dart';
import 'package:safe_meetings/auxiliar/date_time.dart';

class SearchMenu extends StatefulWidget {
  @override
  _SearchMenuState createState() => _SearchMenuState();
}

class _SearchMenuState extends State<SearchMenu> {
  String titleFilter = "";
  String localFilter = "";
  int hygienFilter = 0;
  int securityFilter = 0;
  int interestFilter = 0;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime(DateTime.now().year + 10, 12, 31);

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

  Widget displayLocalForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("Local (empty = no filter)",
              style: TextStyle(fontSize: 20, color: color)),
          TextField(
            decoration: InputDecoration(
              hintText: 'title',
              focusColor: Colors.white,
            ),
            onChanged: (value) {
              setState(() {
                this.localFilter = value;
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
              Container(
                width: 0,
                child: Text('0',
                    style: TextStyle(
                      color: color,
                    )),
              ),
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
              Container(
                width: 0,
                child: Text('1',
                    style: TextStyle(
                      color: color,
                    )),
              ),
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
              Container(
                width: 0,
                child: Text('2',
                    style: TextStyle(
                      color: color,
                    )),
              ),
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
              Container(
                width: 0,
                child: Text('3',
                    style: TextStyle(
                      color: color,
                    )),
              ),
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
              Container(
                width: 0,
                child: Text('4',
                    style: TextStyle(
                      color: color,
                    )),
              ),
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
              Container(
                width: 0,
                child: Text('5',
                    style: TextStyle(
                      color: color,
                    )),
              ),
            ],
          ),
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
              Container(
                width: 0,
                child: Text('0',
                    style: TextStyle(
                      color: color,
                    )),
              ),
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
              Container(
                width: 0,
                child: Text('1',
                    style: TextStyle(
                      color: color,
                    )),
              ),
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
              Container(
                width: 0,
                child: Text('2',
                    style: TextStyle(
                      color: color,
                    )),
              ),
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
              Container(
                width: 0,
                child: Text('3',
                    style: TextStyle(
                      color: color,
                    )),
              ),
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
              Container(
                width: 0,
                child: Text('4',
                    style: TextStyle(
                      color: color,
                    )),
              ),
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
              Container(
                width: 0,
                child: Text('5',
                    style: TextStyle(
                      color: color,
                    )),
              ),
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
              Container(
                width: 0,
                child: Text('0',
                    style: TextStyle(
                      color: color,
                    )),
              ),
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
              Container(
                width: 0,
                child: Text('1',
                    style: TextStyle(
                      color: color,
                    )),
              ),
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
              Container(
                width: 0,
                child: Text('2',
                    style: TextStyle(
                      color: color,
                    )),
              ),
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
              Container(
                width: 0,
                child: Text('3',
                    style: TextStyle(
                      color: color,
                    )),
              ),
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
              Container(
                width: 0,
                child: Text('4',
                    style: TextStyle(
                      color: color,
                    )),
              ),
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
              Container(
                width: 0,
                child: Text('5',
                    style: TextStyle(
                      color: color,
                    )),
              ),
            ],
          )
        ])
      ]),
    );
  }

  Widget displayStartDate() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Text("Start Date",
              style: TextStyle(
                fontSize: 20,
                color: color,
              )),
          ListTile(
            title:
                Text("${startDate.year}-${startDate.month}-${startDate.day}"),
            trailing: IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () {
                this.pickDate(true);
              },
            ),
          )
        ]));
  }

  Widget displayEndDate() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Text("End Date",
              style: TextStyle(
                fontSize: 20,
                color: color,
              )),
          ListTile(
            title: Text("${endDate.year}-${endDate.month}-${endDate.day}"),
            trailing: IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () {
                this.pickDate(false);
              },
            ),
          )
        ]));
  }

  Widget displayFilterButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context, {
          'titleFilter': this.titleFilter,
          'localFilter': this.localFilter,
          'hygienFilter': this.hygienFilter,
          'interestFilter': this.interestFilter,
          'securityFilter': this.securityFilter,
          'startDate': parseDateToString(this.startDate),
          'endDate': parseDateToString(this.endDate),
        });
      },
      child: Text('Filter'),
    );
  }

  pickDate(bool start) async {
    DateTime dateTime;

    if (start)
      dateTime = this.startDate;
    else
      dateTime = this.endDate;
    DateTime ret = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 20, 1, 1),
      lastDate: DateTime(DateTime.now().year + 20, 12, 31),
      initialDate: dateTime,
    );

    if (ret != null) {
      setState(() {
        if (start)
          this.startDate = ret;
        else
          this.endDate = ret;
      });
    }
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
        body: ListView(
            key: const Key("searchScreen"),
            padding: const EdgeInsets.all(8.0),
            children: [
              Container(
                child: Column(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 5, color: Colors.green))),
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
                        this.displayStartDate(),
                        this.displayEndDate(),
                        this.displayLocalForm(),
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
