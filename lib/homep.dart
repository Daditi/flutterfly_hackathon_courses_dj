import 'package:flutter/material.dart';
import 'cus.dart';
import 'math.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      
        body: Container(
          child: Column(children: [
            
            SizedBox(height: 70,),
            Center(
              child: Text(
                'COURSES',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.indigo[1100],
                ),
              ),
            ),
            SizedBox(height: 30.0,),
           Padding(
             padding: const EdgeInsets.only(left: 15.0),
             child: Row(
               children: [
                 Card(
                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    ),
                   child: Column(
                     children: [
                       Image.asset('assets/math.jpg',height: 100,),
                       Row(
                         children: [
                           IconButton(
                             icon:  Icon(Icons.view_module), 
                             
                             onPressed: () {
                               Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Mathvideos()),
                              );
                             },
                            ),
                            SizedBox(width: 25,),
                            IconButton(
                             icon:  Icon(Icons.assignment), 
                             
                             onPressed: () {
                               Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Mathvideos()),
                              );
                             },
                            ),
                         ],
                       ),
                     ],
                   ),
                  
                   
                  ),
                  SizedBox(width: 20,),
                  Card(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  ),
                   child: Column(
                     children: [
                       Image.asset('assets/math.jpg',height: 100,),
                       IconButton(
                         icon:  Icon(Icons.view_module), 
                         
                         onPressed: () {
                           print("working");
                         },
                        ),
                     ],
                   ),

                   
                  ),
                  
               ],
             ),
           ),
           SizedBox(height: 20,),
          Padding(
             padding: const EdgeInsets.only(left: 15.0),
             child: Row(
               children: [
                 Card(
                   child: Column(
                     children: [
                       Image.asset('assets/math.jpg',height: 100,),
                       IconButton(
                         icon:  Icon(Icons.view_module), 
                         
                         onPressed: () {
                           print("working");
                         },
                        ),
                     ],
                   ),
                  
                   
                  ),
                  SizedBox(width: 20,),
                  Card(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    ),
                   child: Column(
                     children: [
                       Image.asset('assets/math.jpg',height: 100,),
                       IconButton(
                         icon:  Icon(Icons.view_module), 
                         
                         onPressed: () {
                           print("working");
                         },
                        ),
                     ],
                   ),

                   
                  ),
                  
               ],
             ),
           ),
          ],),
        ),

    );
  }
}


