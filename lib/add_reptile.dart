import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snakeapp/reptile_list.dart';
import 'package:snakeapp/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class addReptile extends StatefulWidget{
  @override
  _addReptileState createState() => _addReptileState();
}
class _addReptileState extends State<addReptile>{
  var nameController = TextEditingController();
  var speciesController = TextEditingController();
  var weightController = TextEditingController();
  var lengthController = TextEditingController();
  var dispositionController = TextEditingController();
  var feedController = TextEditingController();
  var imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:
     SingleChildScrollView(

     child:Column(
        children: <Widget>[
           AppBar(
            title:  Text(
              "New Reptile",
              style:  TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),

          ),
          TextField(
            controller: nameController,
            obscureText: false,
            decoration: InputDecoration(border: OutlineInputBorder(),
              labelText: 'Name',
            ),
          ),
          TextField(
            controller: speciesController,
            obscureText: false,
            decoration: InputDecoration(border: OutlineInputBorder(),
              labelText: 'Species',
            ),
          ),
          TextField(
            controller: weightController,
            obscureText: false,
            decoration: InputDecoration(border: OutlineInputBorder(),
              labelText: 'Weight(grams)',
            ),
          ),
          TextField(
            controller: lengthController,
            obscureText: false,
            decoration: InputDecoration(border: OutlineInputBorder(),
              labelText: 'Length(in)',
            ),
          ),
          TextField(
            controller: dispositionController,
            obscureText: false,
            decoration: InputDecoration(border: OutlineInputBorder(),
              labelText: 'Disposition',
            ),
          ),
          TextField(
            controller: feedController,
            obscureText: false,
            decoration: InputDecoration(border: OutlineInputBorder(),
              labelText: 'Last Feeding(Days)',
            ),
          ),
          TextField(
            controller: imageController,
            obscureText: false,
            decoration: InputDecoration(border: OutlineInputBorder(),
              labelText: 'Image-URL',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('Add'),
                onPressed:()async {
                  final FirebaseUser user = await FirebaseAuth.instance.currentUser();
                  FirebaseDatabase.instance.reference().child("Reptiles/Names/"+user.uid+"/"+nameController.text).set(
                    {
                      "species" : speciesController.text,
                      "weight" : weightController.text,
                      "length" : lengthController.text,
                      "disposition" : dispositionController.text,
                      "lastfeed" : feedController.text,
                      "image" : imageController.text,
                      "name" : nameController.text,
                    }
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) => userProfile()),);
                },
              ),
            ],
          ),
        ],
      ),
     ),
    );
  }

}