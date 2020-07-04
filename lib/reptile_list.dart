import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:snakeapp/add_reptile.dart';
import 'package:snakeapp/display_reptile.dart';
import 'package:snakeapp/login_page.dart';
import 'package:flutter/cupertino.dart';
class userProfile extends StatefulWidget{
  @override
  _userProfileState createState() => _userProfileState();
}
class _userProfileState extends State<userProfile>{


 var reptileList = [];
  _userProfileState() {//constructor
    FirebaseAuth.instance.currentUser().then((user){
      FirebaseDatabase.instance.reference().child("Reptiles/Names/"+user.uid).once().then((datasnapshot){
        var reptileTmpList = [];
        datasnapshot.value.forEach((k,v){
          reptileTmpList.add(v);
        });
        reptileList = reptileTmpList;
        setState((){

        });
      });
    });
  }
Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Reptiles",
          style: TextStyle(fontSize: 24),),
        leading:  IconButton(
          icon:  Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => loginpage()),
            );
          },
        ),
          actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.add),
                      tooltip: 'Add new reptile entry',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder:(context) => addReptile()),);

                      },
      ),
      ],
      ),
      body:
      ListView.builder(
        itemCount: reptileList.length,
          itemBuilder: (BuildContext context, int index){
            return ListTile(
              onTap: (){

                Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) => displayReptile(mystring: '${reptileList[index]["name"]}')));
              },
              title: Container(
                height: 70,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 4.0, color: Colors.black),
                    ),
                  ),
                margin: EdgeInsets.only(top: 5,bottom:5),
                child:
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left:20,right:20),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage('${reptileList[index]['image']}'),
                          radius: 50,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right:10),
                        child: Text(
                          '${reptileList[index]["name"]}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  )
              )
            );
          }
      ),
    );
}
//    return Scaffold(
//      extendBody: true,
//      body:
//          CustomScrollView(
//            slivers: <Widget>[
//              SliverAppBar(
//                  floating: false,
//                  snap: false,
//                  pinned:  true,
//
//                  expandedHeight: 50.0,
//
//                  flexibleSpace: FlexibleSpaceBar(
//                    centerTitle: true,
//                    title: Text('Your Reptiles'),
//                  ),
//                  actions: <Widget>[
//                    IconButton(
//                      icon: const Icon(Icons.add),
//                      tooltip: 'Add new reptile entry',
//                      onPressed: () {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(builder:(context) => addReptile()),);
//
//                      },
//                    ),
//
//                  ]
//              ),
//              SliverFixedExtentList(
//
//                itemExtent: 70.0,
//                delegate: SliverChildBuilderDelegate(
//                      (BuildContext context, int index) {
//                    return Container(
//                      decoration: BoxDecoration(
//                        border: Border(
//                          bottom: BorderSide(width: 4.0, color: Colors.black),
//                        ),
//                      ),
//                      margin: EdgeInsets.all(1),
//                      alignment: Alignment.centerLeft,
//
//                    );
//                  },
//                ),
//              ),
//                ],
//
//              ),
//
//
//
//
//
//
//    );


}