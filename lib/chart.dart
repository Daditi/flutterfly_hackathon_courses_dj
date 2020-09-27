import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
List l=[];
class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {

  @override
  Widget build(BuildContext context) {

    Future getitt() async {
      final db = await Firestore.instance.collection('mathquestions')
      .getDocuments().then((snap){
        snap.documents.forEach((f){
          l.add(f.data);
        });
      });
      print(l[0]);
    }
    getitt();
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '1) ${l[0]['question']}',
              style: TextStyle(color: Colors.blueGrey[900], fontSize: 20,letterSpacing: 2,decoration: null),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            child: Center(
               child: Container(

                height: 400,
                child: SfCartesianChart(
primaryXAxis: CategoryAxis(),
                  primaryYAxis: NumericAxis(),
                  series: <ChartSeries>[
                    ColumnSeries<SalesData,String>(
                      dataSource: getColumnData1(),
                      xValueMapper: (SalesData sales,_)=>sales.x,
                      yValueMapper: (SalesData sales,_)=>sales.y,
                    dataLabelSettings: DataLabelSettings(
                    isVisible:true
                )
                    ),

                  ],

                ),

              ),


            ),

          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '2) ${l[1]['question']}',
              style: TextStyle(color: Colors.blueGrey[900], fontSize: 20,letterSpacing: 2,decoration: null),
            ),
          ),
          SizedBox(height: 10,),
          Center(

            child: Container(

              height: 400,

              child: SfCartesianChart(

                primaryXAxis: CategoryAxis(),

                primaryYAxis: NumericAxis(),

                series: <ChartSeries>[

                  ColumnSeries<SalesData,String>(

                      dataSource: getColumnData2(),

                      xValueMapper: (SalesData sales,_)=>sales.x,

                      yValueMapper: (SalesData sales,_)=>sales.y,

                      dataLabelSettings: DataLabelSettings(

                          isVisible:true

                      )

                  ),



                ],



              ),



            ),





          ),




        ],
      ),
    );
  }
}

class SalesData{

  String x;
  int y;
  SalesData(this.x,this.y);
}

dynamic getColumnData1() {

  List<SalesData> columnData = <SalesData>[
    SalesData('a1', l[0]['a1']),
    SalesData('a2', l[0]['a2']),
    SalesData('a3', l[0]['a3']),
    SalesData('a4', l[0]['a4']),


  ];
  return columnData;
}
dynamic getColumnData2() {

  List<SalesData> columnData = <SalesData>[
    SalesData('a1', l[1]['a1']),
    SalesData('a2', l[1]['a2']),
    SalesData('a3', l[1]['a3']),
    SalesData('a4', l[1]['a4']),


  ];
  return columnData;
}
