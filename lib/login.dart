import 'Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final fire = Firestore.instance;
String email='';
String password='';
 Future signIn() async {
   try{
     final result = await auth.signInWithEmailAndPassword(email: email, password: password);
    return 'success';
   }catch(e){
     print(e);
     return null;
   }
 }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[

                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/background.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(1, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/light-1.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.3, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/light-2.png')
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(1.5, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/clock.png')
                              )
                          ),
                        )),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(1.8, Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[100]))
                              ),
                              child: TextField(
                                onChanged: (val){
                                  setState(() {
                                    email=val;
                                  });
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.grey[600])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (val){
                                  setState(() {
                                    password=val;
                                  });
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey[600])
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                      SizedBox(height: 30,),
                     FadeAnimation(2, RaisedButton(onPressed: () async {
                       String value = await signIn();
                       if(value=='success'){
                       print('success');}else{
                         print('fail');
                       }
                     },
                     child: Center(
                       child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                     ),
                       color: Colors.indigo[900],
                       textColor: Colors.white,
                       hoverColor: Colors.indigo[300],
                     ),

//                      Container(
//                        height: 50,
//                        decoration: BoxDecoration(
//
//                            borderRadius: BorderRadius.circular(10),
//                            gradient: LinearGradient(
//                                colors: [
//                                  Colors.indigo[900],
//                                  Colors.indigo[300],
//                                ]
//                            )
//                        ),
//                        child: Center(
//                          child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
//                        ),
//                      )
                     ),
                      SizedBox(height: 70,),
                      FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color: Colors.indigo[700]))),

                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}