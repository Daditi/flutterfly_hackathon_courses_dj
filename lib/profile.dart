import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {

    Map val = ModalRoute.of(context).settings.arguments;
    print(val);
    String as=val['as'];
    String uid=val['uid'];
    print(as);
List<dynamic> l=[];
    Future getitt() async {
      final db = await Firestore.instance.collection('${as}')
          .getDocuments().then((snap){
        snap.documents.forEach((f){
          l.add(f.data);
        });
      });
      print(l[0]);
    }
    getitt();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(blurRadius: 3, color: Colors.grey[300], spreadRadius: 1)
              ],
            ),
                child: CircleAvatar(
                  
                  radius: 70.0,
                  backgroundImage: AssetImage('assets/dp.jpg'),
                ),
              ),
            ),
            Divider(
              color: Colors.grey[800],
              height: 60.0,
            ),
            Text(
              'Name',
              style: TextStyle(
                color: Colors.grey[800],
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Sakshi',
              style: TextStyle(
                color: Colors.indigoAccent[600],
                fontWeight: FontWeight.bold,
                fontSize: 23.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[800],
                ),
                SizedBox(width: 10.0),
                Text(
                  'sak@gmail.com',
                  style: TextStyle(
                    color: Colors.indigoAccent[900],
                    fontSize: 20.0,
                    letterSpacing: 2.0,
                  ),
                )
              ],
            ),
          ]
        )
    )
    );
  }
}