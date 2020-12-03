import 'package:flutter/material.dart';
import 'package:safe_meetings/conference.dart';
import 'package:safe_meetings/auth.dart';


class Participant extends StatefulWidget {
  @override
  _PartState createState() => _PartState();
}


class _PartState extends State<Participant> {
  List<Conference> conferences = [];
  Authentication auth = Authentication();

  List<Widget> showConfs() {
    List<Widget> confs = [];

    for (int i = 0; i < conferences.length; i++) {
      String usermail=auth.getCurrentUser().email;
      
      if (conferences[i].isParticipant(usermail) && conferences[i].hasntVoted(usermail) ) { //isParticpant retorna true se o email do participante estiver na lista dada pela conferencia.
        confs.add(
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, '/insert_code', //vai para a pagina onde coloca o código para entrar no questionário
                  arguments: conferences[i]);
                  //colocar na base de dados o email da pessoa que votou -> talvez colocar  em submit no evaluation.dart?
                  conferences[i].vote(usermail);
            },
            child: Center(child: Text(conferences[i].getName(), style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400))),
            color: Colors.green[300],
          ),
        );
      }
    }

    return confs;
  }

  @override
  Widget build(BuildContext context) {
    // gets the conferences passes by the loading screen
    conferences = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Safe Meetings', style: TextStyle(color: Colors.green[800])),
        backgroundColor: Colors.green[50],
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            color: Colors.green[800],
            onPressed: () {}, // it should refresh the home screen
          ),
          IconButton(
              icon: Icon(Icons.search),
              color: Colors.green[800],
              onPressed: () {
                // SearchMenu(this.changeFilters);
              } // it should open the search menu
              )
        ],
      ),
      backgroundColor: Colors.white,
      body: GridView.count(
        padding: EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: this.showConfs(),
      ),
    );
  }
}