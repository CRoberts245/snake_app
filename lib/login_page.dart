import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:snakeapp/signup_page.dart';
import 'reptile_list.dart';
import 'dart:async';

class loginpage extends StatefulWidget {


  @override
  _loginpageState createState()=>_loginpageState();
}
class _loginpageState extends State<loginpage>{
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
              image: NetworkImage('https://images.fineartamerica.com/images-medium-large-5/1-kenyan-sand-boa-eryx-colubrinus-david-kenny.jpg'),
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
                    child: Text('Login'),
                    onPressed:(){
                      FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
                      .then((value){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder:(context) => userProfile()),);
                      }).catchError((error){
                        setState(() {
                          visibility1 = true;
                        });
                      });


                    },
                  ),
                  Text('             '),
                  RaisedButton(
                    child: Text('Sign Up?'),
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context) => signupPage()),
                      );
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