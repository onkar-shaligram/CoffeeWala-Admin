import 'package:coffeewala_admin/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'brew_tile.dart';
 //List<int> _list = List.generate(20, (i) => i);
  var i;
  var p;
  

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {

  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context) ?? [];

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        i = index;
        p=index;
        return BrewTile(brew: brews[index]);
        
      },
    );
  }
}

class BrewTile extends StatefulWidget {
  final Brew brew;
  BrewTile({this.brew});
  

  @override
  _BrewTileState createState() => _BrewTileState();
}

class _BrewTileState extends State<BrewTile> {

 List<bool> _selected = List.generate(200, (i) => false);
  

  @override
  Widget build(BuildContext context) {
    final x = p;
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        color: _selected[i] ? Colors.blue : Colors.white,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[widget.brew.strength],
          ),
          title: Text(widget.brew.name),
          subtitle: Wrap(children: [
            Text('${widget.brew.sugars} sugar packet(s) | '),
            Text(' ${widget.brew.coffees} | '),
            Text(' ${widget.brew.strength} |'),
            Text(' Snacks - ${widget.brew.snacks} || '),
            Text(' Order No - $x', style: TextStyle(color: Colors.black),),
          ],),
          onTap: () {
            // set up the buttons
            Widget cancelButton = FlatButton(
              child: Text("NO"),
              onPressed: () {
                setState(() => _selected[i] = false);
                Navigator.pop(context);
              },
            );
            Widget continueButton = FlatButton(
              child: Text("YES"),
              onPressed: () {
                setState(() => _selected[i] = true);
                
                setState(() {
                  _selected[i] = true;
                });
                Navigator.pop(context);
              },
            );

            // set up the AlertDialog
            AlertDialog alert = AlertDialog(
              title: Text("Is this Order finished?"),
              content:
                  Text("This will send the card to archives list."),
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
          },
        ),
      ),
    );
  }
}


