import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:snakeapp/add_reptile.dart';
import 'package:snakeapp/display_reptile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snakeapp/login_page.dart';

class displayReptile extends StatefulWidget {
  final String mystring;
  displayReptile({this.mystring});
  @override
  _displayReptileState createState() => _displayReptileState(mystring: mystring);
}
class _displayReptileState extends State<displayReptile>{

final String mystring;
var name;
var weight;
 var disposition;
 var length;
 var image;
 var lastfeed;
var species;
var reptileStats= [];

  _displayReptileState({this.mystring}){
    FirebaseAuth.instance.currentUser().then((user){
        FirebaseDatabase.instance.reference().child("Reptiles/Names/"+user.uid+"/"+mystring).once().then((datasnapshot){

       setState((){
         name =  datasnapshot.value["name"];
         disposition = datasnapshot.value["disposition"];
         length =  datasnapshot.value["length"];
         weight =  datasnapshot.value["weight"];
         image =  datasnapshot.value["image"];
         lastfeed =  datasnapshot.value["lastfeed"];
         species =  datasnapshot.value["species"];
       });
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left:20,right:20, bottom:10),
              child: CircleAvatar(
                backgroundImage: NetworkImage(image),
                radius: 200,
              ),
              ),
            Container(
              margin: EdgeInsets.only(top:5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 6,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(mystring,
                textAlign: TextAlign.center,
                style:
                TextStyle(
                  fontSize: 35,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3
                    ..color = Colors.lightGreen[700],
                ),
              ),
            ),
            Container(
               height: 45,
               decoration: BoxDecoration(
                                      border: Border(
                                       bottom: BorderSide(width: 4.0, color: Colors.black),),),
             margin: EdgeInsets.only(top: 5,bottom:5),
              child: Text("Weight(grams): "+weight,
                   style: TextStyle(fontSize: 24),),
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 4.0, color: Colors.black),),),
              margin: EdgeInsets.only(top: 5,bottom:5),
              child: Text("Last Feed(Days): "+lastfeed,
                style: TextStyle(fontSize: 24),),
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 4.0, color: Colors.black),),),
              margin: EdgeInsets.only(top: 5,bottom:5),
              child: Text("Length(in): "+length,
                style: TextStyle(fontSize: 24),),
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 4.0, color: Colors.black),),),
              margin: EdgeInsets.only(top: 5),
              child: Text("Disposition: "+disposition,
                style: TextStyle(fontSize: 24),),
            ),



          ],


        )
    );
  }
}
//      ListView.builder(
//
//            itemCount: reptileStats.length,
//            itemBuilder: (BuildContext context, int index){
//              return ListTile(
//                  title: Container(
//
//                      decoration: BoxDecoration(
//                        border: Border(
//                          bottom: BorderSide(width: 4.0, color: Colors.black),
//                          top: BorderSide(width: 4.0, color: Colors.black),
//                          left: BorderSide(width: 4.0, color: Colors.black),
//                          right: BorderSide(width: 4.0, color: Colors.black),
//                        ),
//                      ),
//                      margin: EdgeInsets.only(top: 5,bottom:5),
//                      child:
//                      Column(
//                        children: <Widget>[
//                          Container(
//                            margin: EdgeInsets.only(left:20,right:20, bottom:10),
//                            child: CircleAvatar(
//                              backgroundImage: NetworkImage('${reptileStats[index]['image']}'),
//                              radius: 200,
//                            ),
//                          ),
//                          Container(
//                            margin: EdgeInsets.only(right:10),
//                            child: Text(
//                              '${reptileStats[index]["name"]}',
//                              style: TextStyle(fontSize: 20),
//                            ),
//                          ),
//                        ],
//                      )
//                  )
//              );
//            }
//        ),





