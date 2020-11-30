import 'package:flutter/rendering.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

class AppInHomeScreen extends Given1WithWorld<String, FlutterWorld> {

  AppInHomeScreen():super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override 
  Future<void> executeStep(String screen) {
    
  }

  @override
  RegExp get pattern => RegExp(r"the app is in {string} screen");
}

StepDefinitionGeneric AppInHomeScreen() {
  return when<FlutterWorld>(
    "the app is in home screen",
    (context) async {
      // final locator = find.byValueKey(key);
      // await FlutterDriverUtils.tap(context.world.driver, locator);
    },
  );
}