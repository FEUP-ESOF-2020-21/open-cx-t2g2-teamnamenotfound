import 'package:firebase_database/firebase_database.dart';
import 'package:safe_meetings/database.dart';

class Conference {
  String _name;
  String _description;
  String _date;
  List<int> _hygien, _interest, _security; // list with all the evaluations

  DatabaseReference _id;

  Conference(name, description, date, hygien, interest, security) {
    this._name = name;
    this._description = description;
    this._date = date;

    this._hygien = hygien;
    this._interest = interest;
    this._security = security;
  }

  void setId(atabaseReference) {
    this._id = databaseReference;
  }

  String getName() {
    return this._name;
  }

  String getDescription() {
    return this._description;
  }

  String getDate() {
    return this._date;
  }

  int getHygien() {
    int hygien = 0;

    for (int i = 0; i < this._hygien.length; i++) {
      hygien += this._hygien[i];
    }

    hygien = (hygien / this._hygien.length).round();

    return hygien;
  }

  int getInterest() {
    int interest = 0;

    for (int i = 0; i < this._interest.length; i++) {
      interest += this._interest[i];
    }

    interest = (interest / this._interest.length).round();

    return interest;
  }

  int getSecurity() {
    int security = 0;

    for (int i = 0; i < this._security.length; i++) {
      security += this._security[i];
    }

    security = (security / this._security.length).round();

    return security;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this._name,
      'description': this._description,
      'date': this._date,
      'hygien': this._hygien,
      'interest': this._interest,
      'security': this._security
    };
  }
}

Conference createConference(record) {
  Map<String, dynamic> attr = {
    'name': '',
    'description': '',
    'date': '',
    'hygien': [],
    'interest': [],
    'security': []
  };

  record.forEach((key, value) => {attr[key] = value});

  Conference conference = new Conference(
      attr['name'],
      attr['description'],
      attr['date'],
      convertFromDynamicToIntList(attr['hygien']),
      convertFromDynamicToIntList(attr['interest']),
      convertFromDynamicToIntList(attr['security']));

  return conference;
}

List<int> convertFromDynamicToIntList(List<dynamic> source) {
  List<int> dest = [];

  for (int i = 0; i < source.length; i++) dest.add(source[i].toInt());

  return dest;
}
