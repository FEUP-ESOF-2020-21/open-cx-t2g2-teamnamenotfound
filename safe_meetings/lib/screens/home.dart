import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Safe Meetings'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh), 
            color: Colors.white,
            onPressed: (){} ,// it should refresh the home screen
            ),
          IconButton(
            icon: Icon(Icons.search), 
            color: Colors.white,
            onPressed: (){} // it should open the search menu
            )
            ],
      ),
      backgroundColor: Colors.green[50],
      body: GridView.count(
        padding: EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: [
          FlatButton(
            onPressed: () {}, 
            child: Center(child: Text('Conference 1')),
            color: Colors.grey[300],
            ),
            FlatButton(
            onPressed: () {}, 
            child: Center(child: Text('Conference 2')),
            color: Colors.grey[300],
            ),
            FlatButton(
            onPressed: () {}, 
            child: Center(child: Text('Conference 3')),
            color: Colors.grey[300],
            )
        ],
        ),
    );
  }
}