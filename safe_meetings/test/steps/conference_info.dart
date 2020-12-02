import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric AppInHomeScreen() {
  return given(
    RegExp(r'the user is logged in with a valid account and the app is in home screen'),
    (context) async {},
  );
}

StepDefinitionGeneric ConferenceTapped() {
  return when<FlutterWorld>(
    'I tap in a conference',
    (context) async {
      final conf = find.byValueKey("conference1");
      // print(FlutterDriverUtils.isAbsent(context.world.driver, conf));
      await FlutterDriverUtils.tap(context.world.driver, conf);
    },
  );
}

StepDefinitionGeneric AppInConferenceInfoScreen() {
  return then<FlutterWorld>(
    'conference info screen shows up',
    (context) async {
      var locator = find.byValueKey("conferenceInfo");
      await FlutterDriverUtils.isPresent(context.world.driver, locator);
    },
  );
}