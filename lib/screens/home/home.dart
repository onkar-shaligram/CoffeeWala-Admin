import 'package:coffeewala_admin/models/brew.dart';
import 'package:coffeewala_admin/screens/home/brew_list.dart';
import 'package:flutter/material.dart';
import 'package:coffeewala_admin/screens/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  //final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("CW -- Admin"),
          elevation: 1.0,
          actions: <Widget>[
          SizedBox(width: 30.0,),

          FlatButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/archives');
            }, 
            icon: Icon(Icons.refresh), 
            label: Text("")),
           
          ],
        ),
        body: Container(
          color: Colors.black,
          child: BrewList(),
        ),
      ),
    );
  }
}
