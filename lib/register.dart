import 'Animation/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final fire = Firestore.instance;
  String email='';
  String password='';
  String fname='';
  String lname='';
  String roll='';
  String div='';
  String status='';
  String std='';



  Future register() async {
    try{
      final result = await auth.createUserWithEmailAndPassword(email: email, password: password);
      final uid =  result.user.uid;

      final user = await fire.collection('student').document(uid).setData({'email':email,'password':password,'fname':fname,'lname':lname,
        'roll':roll,'std':std,'div':div});
      return uid;
    }catch(e){
      print('notttttttttt');
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
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (val){
                                  setState(() {
                                    fname=val;
                                  });
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "First Name",
                                    hintStyle: TextStyle(color: Colors.grey[600])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (val){
                                  setState(() {
                                    lname=val;
                                  });
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Last Name",
                                    hintStyle: TextStyle(color: Colors.grey[600])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (val){
                                  setState(() {
                                    std=val;
                                  });
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Class",
                                    hintStyle: TextStyle(color: Colors.grey[600])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (val){
                                  setState(() {
                                    div=val;
                                  });
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Division",
                                    hintStyle: TextStyle(color: Colors.grey[600])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (val){
                                  setState(() {
                                    roll=val;
                                  });
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Roll No.",
                                    hintStyle: TextStyle(color: Colors.grey[600])
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                      SizedBox(height: 30,),
                      FadeAnimation(2, RaisedButton(onPressed: () async {
                        String value=  await register();
                        if(value==null){
                          print('failed');
                        }else{
                          print(value);
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