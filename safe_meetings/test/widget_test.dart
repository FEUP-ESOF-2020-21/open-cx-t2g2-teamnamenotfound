import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:safe_meetings/auxiliar/database.dart';
import 'package:safe_meetings/objects/conference.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

    // setup
    // run
    // verify

  test('Database tests', () async {
    List<Conference> conferences = [];
    conferences = await getConferencesFromDatabase();

    /*for (int i = 0; i < conferences.length; i++) print(conferences[i]);*/
    print(conferences.length);

  });
}