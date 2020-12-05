import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric ScreenShowsUp() {
  return then1<String, FlutterWorld>(
    '{string} screen shows up',
    (screen, context) async {
      sleep(Duration(seconds: 5));
      await FlutterDriverUtils.isPresent(context.world.driver, find.byValueKey(screen));
    },
  );
}