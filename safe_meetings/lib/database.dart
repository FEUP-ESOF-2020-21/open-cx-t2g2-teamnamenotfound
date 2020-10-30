import 'package:firebase_database/firebase_database.dart';
import 'package:safe_meetings/conference.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference updateConference(Conference conference) {
  var id = databaseReference.child('conferences/').push();
  id.set(conference.toJson());

  return id;
}

Future<List<Conference>> getConferences() async {
  DataSnapshot dataSnapshot = await databaseReference.child('conferences/').once();
  List<Conference> conferences = [];

  if(dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Conference conference = createConference(value);
      conference.setId(databaseReference.child('posts/' + key));
      conferences.add(conference);
    });
  }

  return conferences;
} 