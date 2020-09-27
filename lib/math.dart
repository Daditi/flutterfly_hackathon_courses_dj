import 'package:flutter/material.dart';
import 'cus.dart';
import 'profile.dart';
import 'homep.dart';


class Mathvideos extends StatefulWidget {
  @override
  _MathvideosState createState() => _MathvideosState();
}

class _MathvideosState extends State<Mathvideos> {
  Widget video() {
    return Container(
      height: 315,
      child: Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.fromLTRB(36.0, 26.0, 36.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('assets/math.jpg'),
              SizedBox(height: 10),
              Text(
                'Sakshi Dhoble',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                'Subject',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Math Courses', style: TextStyle(fontSize: 25.0,),),
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
      ),
      body: video(),
      


    );
  }
}