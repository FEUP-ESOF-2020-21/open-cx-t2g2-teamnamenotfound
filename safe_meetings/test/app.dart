import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'package:safe_meetings/main.dart';
import 'package:safe_meetings/screens/sign_in.dart';
import 'package:safe_meetings/screens/sign_out.dart';

void main() async {

  enableFlutterDriverExtension();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(SafeMeetings(SignInMock(), SignOutMock()));
}