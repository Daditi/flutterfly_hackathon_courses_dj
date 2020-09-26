import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          height: 500,
          child: SfCartesianChart(
primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(),
            series: <ChartSeries>[
              ColumnSeries<SalesData,String>(
                dataSource: getColumnData(),
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

    );
  }
}

class SalesData{
  String x;
  int y;
  SalesData(this.x,this.y);
}

dynamic getColumnData(){
  List<SalesData> columnData = <SalesData>[
    SalesData('BMW', 20),
    SalesData('merci', 30),
    SalesData('Honda', 40),
  ];
  return columnData;
}
