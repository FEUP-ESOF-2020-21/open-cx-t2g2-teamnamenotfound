import 'package:flutter/material.dart';

class SearchMenu extends StatefulWidget {
  // final Function(int, int, int) changeFilters;

  // SearchMenu(this.changeFilters);

  @override
  _SearchMenuState createState() => _SearchMenuState();
}

class _SearchMenuState extends State<SearchMenu> {

  // void filter() {
  //    widget.changeFilters(0, 0, 0);
  // }

  @override
  Widget build(BuildContext context) {
    return Text("Search");
    // return FlatButton(
    //   onPressed: () {
        // this.filter();
    //   },
    //   child: null
    //   );
  }
}