import 'package:flutter/material.dart';

class SeeInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        backgroundColor: Colors.green,
        title: Text('Safe Meetings'), 
      ),
      backgroundColor: Colors.green[50],
      body: Text("see info"),
        );
  }
}