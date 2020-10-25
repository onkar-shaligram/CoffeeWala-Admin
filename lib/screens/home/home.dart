import 'package:coffeewala_admin/models/brew.dart';
import 'package:coffeewala_admin/screens/home/brew_list.dart';
import 'package:flutter/material.dart';
import 'package:coffeewala_admin/screens/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
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
          // actions: <Widget>[
          //   FlatButton.icon(
          //     onPressed: () async {
          //       Navigator.pushNamed(context, '/archives');
          //     },
          //     icon: Icon(
          //       Icons.refresh,
          //       color: Colors.white,
          //     ),
          //     label: Text(""),
          //   ),
          // ],
        ),
        body: Container(
          child: BrewList(),
        ),
      ),
    );
  }
}


