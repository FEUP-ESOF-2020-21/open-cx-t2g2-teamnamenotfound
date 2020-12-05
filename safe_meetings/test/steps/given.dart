import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric AppInHomeScreen() {
  return given<FlutterWorld>(
    'the user is logged in with a valid account and the app is in home screen',
    (context) async {
      sleep(Duration(seconds: 10));
      await FlutterDriverUtils.tap(context.world.driver, find.byValueKey("login"));
    },
  );
}