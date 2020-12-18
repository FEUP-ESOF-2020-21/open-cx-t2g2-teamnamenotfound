import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:safe_meetings/auxiliar/database.dart';
import 'dart:developer';

import 'package:safe_meetings/screens/home.dart';

class Conference {
  String _name;
  String _description;
  String _date;
  String _hour;
  String _local;
  String _code;
  String _key;
  List<int> _hygien, _interest, _security; // list with all the evaluations
  List<String> _users, _votedUsers, _organizers; // list with all the users

  DatabaseReference _id;

  Conference(name, description, date, hour, local, hygien, interest, security,
      users, votedUsers, code, organizers) {
    this._name = name;
    this._description = description;
    this._date = date;
    this._hour = hour;
    this._local = local;

    this._hygien = hygien;
    this._interest = interest;
    this._security = security;
    this._users = users; //participantes das conferencias
    this._votedUsers = votedUsers; //utilizadores que já avaliaram
    this._code = code; //codigo para aceder às conferencias
    this._organizers = organizers; //organizadores da conferencia
  }

  void setId(databaseReference) {
    this._id = databaseReference;
  }

  void setKey(key) {
    this._key = key;
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

  String getHour() {
    return this._hour;
  }

  String getLocal() {
    return this._local;
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

  List<String> getUsers() {
    return this._users;
  }

  List<String> getVotedUsers() {
    return this._votedUsers;
  }

  List<String> getOrganizers() {
    return this._organizers;
  }

  //verifica se o user é participante desta conferencia
  bool isParticipant(String userEmail) {
    for (int i = 0; i < _users.length; i++) {
      if (this._users[i] == userEmail) return true;
    }
    return false;
  }

  //verifica se o user é organizador desta conferencia
  bool isOrganizer(String userEmail) {
    for (int i = 0; i < _organizers.length; i++) {
      if (this._organizers[i] == userEmail) return true;
    }
    return false;
  }

  //verifica que ainda não votou
  bool hasntVoted(String usermail) {
    for (int i = 0; i < this._votedUsers.length; i++) {
      if (this._votedUsers[i] == usermail) return false;
    }
    return true;
  }

  String getCode() {
    return this._code;
  }

  //adiciona ao votedUser o usermail depois de avaliar.
  void vote(String usermail) {
    this._votedUsers.add(usermail);
    databaseReference
        .child('conferences')
        .child(this._key)
        .update({'usersVoted': this._votedUsers});
  }

  /* já está definido na base de dados
  //organizador coloca os emails dos participantes depois de ocorrer a conferencia, suposto adicionar à base de dados
  void setEmails(emails){
    this._users=emails;
  }

  //organizador coloca o código após a conferencia
  void setCode(String code){
    this._code=code;
  }*/

  //colocar na base de dados os valores adquiridos na avaliação
  void setEvaluation(hygieneEvaluate, interestEvaluate, securityEvaluate) {
    this._hygien.add(hygieneEvaluate);
    this._interest.add(interestEvaluate);
    this._security.add(securityEvaluate);

    databaseReference
        .child('conferences')
        .child(this._key)
        .update({'hygien': this._hygien});
    databaseReference
        .child('conferences')
        .child(this._key)
        .update({'interest': this._interest});
    databaseReference
        .child('conferences')
        .child(this._key)
        .update({'security': this._security});
  }

  Map<String, dynamic> toJson() {
    return {
      'name': this._name,
      'description': this._description,
      'date': this._date,
      'hour': this._hour,
      'local': this._local,
      'hygien': this._hygien,
      'interest': this._interest,
      'security': this._security,
      'users': this._users,
      'usersVoted': this._votedUsers,
      'code': this._code,
      'organizers': this._organizers,
    };
  }
}

Conference createConference(record) {
  Map<String, dynamic> attr = {
    'name': '',
    'description': '',
    'date': '',
    'hour': '',
    'local': '',
    'hygien': [],
    'interest': [],
    'security': [],
    'users': [],
    'usersVoted': [],
    'organizers': [],
    'code': ''
  };

  record.forEach((key, value) => {attr[key] = value});

  Conference conference = new Conference(
      attr['name'],
      attr['description'],
      attr['date'],
      attr['hour'],
      attr['local'],
      convertFromDynamicToIntList(attr['hygien']),
      convertFromDynamicToIntList(attr['interest']),
      convertFromDynamicToIntList(attr['security']),
      convertFromDynamicStringList(attr['users']),
      convertFromDynamicStringList(attr['usersVoted']),
      attr['code'],
      convertFromDynamicStringList(attr['organizers']));

  return conference;
}

List<int> convertFromDynamicToIntList(List<dynamic> source) {
  List<int> dest = [];

  for (int i = 0; i < source.length; i++) dest.add(source[i].toInt());

  return dest;
}

List<String> convertFromDynamicStringList(List<dynamic> source) {
  List<String> dest = [];

  for (int i = 0; i < source.length; i++) dest.add(source[i]);

  return dest;
}

class ConferenceMock extends Conference {
  ConferenceMock(name, description, date, hour, local, hygien, interest, security, users, votedUsers, code, organizers)
          : super(name, description, date, hour, local, hygien, interest, security, users, votedUsers, code, organizers);

  @override
  void setEvaluation(hygieneEvaluate, interestEvaluate, securityEvaluate) {
    this._hygien.add(hygieneEvaluate);
    this._interest.add(interestEvaluate);
    this._security.add(securityEvaluate);
  }

  @override
  void vote(String usermail) {
    this._votedUsers.add(usermail);
  }
}