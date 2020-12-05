import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:safe_meetings/database.dart';
import 'dart:developer';

class Conference {
  String _name;
  String _description;
  String _date;
  String _hour;
  String _local;
  String _code;
  List<int> _hygien, _interest, _security; // list with all the evaluations
  List<String> _users, _votedUsers; // list with all the users

  DatabaseReference _id;

  Conference(name, description, date, hour, local, hygien, interest, security, users, votedUsers, code) {
    this._name = name;
    this._description = description;
    this._date = date;
    this._hour = hour;
    this._local = local;

    this._hygien = hygien;
    this._interest = interest;
    this._security = security;
    this._users=users; //participantes das conferencias
    this._votedUsers=votedUsers; //utilizadores que já avaliaram
    this._code=code; //codigo para aceder às conferencias
  }

  void setId(databaseReference) {
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

   //verifica se o user é participante desta conferencia
  bool isParticipant(String userEmail){
    for(int i=0; i<_users.length; i++){
      if(this._users[i]==userEmail)
        return true;
    }
    return false;
  }

  //verifica que ainda não votou
  bool hasntVoted(String usermail){
    for(int i=0; i<this._votedUsers.length; i++){
      if(this._votedUsers[i]==usermail)
        return false;
    }
    return true;
  }

  String getCode(){
    return this._code;
  }

  //adiciona ao votedUser o usermail depois de avaliar.
  void vote(String usermail){
    this._votedUsers.add(usermail);
  }
  
  //organizador coloca os emails dos participantes depois de ocorrer a conferencia, suposto adicionar à base de dados
  void setEmails(emails){
    this._users=emails;
  }

  //organizador coloca o código após a conferencia
  void setCode(String code){
    this._code=code;
  }
  //colocar na base de dados os valores adquiridos na avaliação
  void setEvaluation(hygieneEvaluate, securityEvaluate, interestEvaluate){
    log('data: $_id');   
    this._hygien.add(hygieneEvaluate);
    this._security.add(securityEvaluate);
    this._interest.add(interestEvaluate);

    //_id.update({'code':'ola'});
    databaseReference.child('MKkcVJQf6GI0xclZBEG').update({'code':'ola'});
    databaseReference.child('MKkcVJQf6GI0xclZBEG').remove();
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
      'users':this._users,
      'usersVoted':this._votedUsers,
      'code':this._code,
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
    'users':[],
    'usersVoted':[],
    'code':''
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
      attr['code']);

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