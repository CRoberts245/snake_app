import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snakeapp/login_page.dart';
import 'reptile_list.dart';
import 'dart:async';

class signupPage extends StatefulWidget {
  @override
  _signupPageState createState()=>_signupPageState();
}
class _signupPageState extends State<signupPage>{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool visibility1 = false;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(

          children:[



            Image(
              image: NetworkImage('https://exopetguides.com/wp-content/uploads/2019/09/cutest-leopard-gecko.jpg'),
              fit: BoxFit.cover,
            ),





            Column(
              children: [

                Container(
                  margin: EdgeInsets.only(top:5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 6,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text('Reptile Tracker',
                    style:
                    TextStyle(
                      fontSize: 50,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3
                        ..color = Colors.lightGreen[700],
                    ),
                  ),
                ),

              ],
            ),




            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left:35,right:35,top:10,bottom:10),
                  child: TextField(
                    controller: emailController,
                    obscureText: false,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),

                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left:35,right:35,top:10,bottom:10),
                  child: TextField(
                    controller: passwordController,
                    obscureText: false,
                    decoration: InputDecoration(border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Visibility(
                  child: Text('Error, try again'),
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: visibility1,
                ),
              ],

            ),


            Container(
              margin: EdgeInsets.only(left:35,right:35,top:45,bottom:5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.lightGreen,
                  width: 20,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    child: Text('Back'),
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context) => loginpage()),
                      );

                    },
                  ),
                  Text('             '),
                  RaisedButton(
                    child: Text('Sign Up!'),
                    onPressed:(){
                      Future<AuthResult> result = FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                      result.then((value){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder:(context) => userProfile()),);
                       });
                      result.catchError((error){
                        setState(() {
                          visibility1 = true;
                        });
                      });
                    },
                  ),

                ],
              ),
            ),
          ],//1st child of Main Login Column
        ),
      ),
    );


  }
}