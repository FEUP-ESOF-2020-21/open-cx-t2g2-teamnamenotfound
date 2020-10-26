import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Safe Meetings'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.search), 
            color: Colors.white,
            onPressed: (){} // it should open the serach menu
            )
            ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FlatButton(
            onPressed: () {}, 
            child: Center(child: Text('Conference 1')),
            color: Colors.grey[200],
            ),
            FlatButton(
            onPressed: () {}, 
            child: Center(child: Text('Conference 2')),
            color: Colors.grey[200],
            ),
            FlatButton(
            onPressed: () {}, 
            child: Center(child: Text('Conference 3')),
            color: Colors.grey[200],
            )
        ],
        ),
    );
  }
}