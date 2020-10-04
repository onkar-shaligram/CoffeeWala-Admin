import 'package:flutter/material.dart';
import 'package:coffeewala_admin/models/brew.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[brew.strength],
            //backgroundImage: AssetImage('assets/coffee_cup.png'),
          ),
          title: Text(brew.name),
          //subtitle: Text('${brew.sugars} sugar packet(s)'),
          subtitle: Wrap(children: [
            Text('${brew.sugars} sugar packet(s) | '),
            Text(' ${brew.coffees} | '),
            Text(' Strength - ${brew.strength}'),
            Text(' Snacks - ${brew.snacks}')
          ],),
          onTap: () {
            showAlertDialog(context);
          },
        ),
      ),
    );
  }
}


showAlertDialog(BuildContext context) {

  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("No"),
    onPressed:  () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Yes"),
    onPressed:  () {
      
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("AlertDialog"),
    content: Text("Order Completed??"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
