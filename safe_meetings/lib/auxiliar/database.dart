import 'package:firebase_database/firebase_database.dart';
import 'package:safe_meetings/objects/conference.dart';
import 'dart:developer';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference updateConferenceInDatabase(Conference conference) {
  var id = databaseReference.child('conferences/').push();
  id.set(conference.toJson());

  return id;
}

Future<List<Conference>> getConferencesFromDatabase() async {
  DataSnapshot dataSnapshot =
      await databaseReference.child('conferences/').once();
  List<Conference> conferences = [];

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Conference conference = createConference(value);
      conference.setId(databaseReference.child('posts/' + key));
      conference.setKey(key);
      conferences.add(conference);
    });
  }

  return conferences;
}
