import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric AppInHomeScreen() {
  return given(
    'the user is logged in with a valid account and the app is in home screen',
    (context) async {},
  );
}

StepDefinitionGeneric ConferenceTapped() {
  return when<FlutterWorld>(
    'I tap in a conference',
    (context) async {
      sleep(Duration(seconds: 30));
      if(find.byValueKey("conference1") == null) print("Isto e null");
      await FlutterDriverUtils.tap(context.world.driver, find.byValueKey("conference1"));
    },
  );
}

StepDefinitionGeneric AppInConferenceInfoScreen() {
  return then(
    'conference info screen shows up',
    (context) async {
      // var locator = find.byValueKey("conferenceInfo");
      // await FlutterDriverUtils.isPresent(context.world.driver, locator);
    },
  );
}