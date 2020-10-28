import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:safe_meetings/database.dart';

class Conference{

  String _name;
  String _description;
  String _date;
  List _hygien, _interest, _security; // list with all the evaluations

  DatabaseReference _id;

  Conference(name, description, date, hygien, interest, security) {
    this._name = name;
    this._description = description;
    this._date = date;

    this._hygien = hygien;
    this._interest = interest;
    this._security = security;
  }

  void setId(atabaseReference){
    this._id = databaseReference;
  }

  Map<String, dynamic> toJson(){
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
    attr['hygien'],
    attr['interest'],
    attr['security']
  );

  return conference;
}