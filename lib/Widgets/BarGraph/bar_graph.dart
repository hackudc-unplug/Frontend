import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'bar_data.dart';

class MyBarGraph extends StatefulWidget {
  final List dailySummary;
  const MyBarGraph({
    super.key,
    required this.dailySummary,
  });

  @override
  State<MyBarGraph> createState() => _MyBarGraphState();
}

class _MyBarGraphState extends State<MyBarGraph> {
  double getMax(List dailySum){
    double currentMax = 0;
    for (var i = 0; i < dailySum.length; i++){
      if (currentMax < dailySum[i]){
        currentMax = dailySum[i];
      }
    }
    return currentMax;
  }
  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        llano: widget.dailySummary[0],
        min: widget.dailySummary[1],
        max: widget.dailySummary[2],
        punta: widget.dailySummary[3],
        total: widget.dailySummary[4],
        valle: widget.dailySummary[5],
    );
    myBarData.initializeBarData();
    return BarChart(
        BarChartData(
          maxY: (getMax(widget.dailySummary)).ceilToDouble(),
          minY: 0,
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),

            bottomTitles: AxisTitles(sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: getBottomTitles,
            ))
          ),
          barGroups: myBarData.barData.
            map((data) => BarChartGroupData(
              x: data.x,
              barRods: [BarChartRodData(
                  toY: data.y,
                  color: Colors.grey[800],
                  width: 25,
                borderRadius: BorderRadius.circular(4),


              )]
            ))
            .toList(),
          ),


        );
  }
}

Widget getBottomTitles(double value, TitleMeta meta){
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  Widget text;
  switch (value.toInt()){
    case 0:
      text = const Text('max',style: style);
    case 1:
      text = const Text('max',style: style);
    case 2:
      text = const Text('punta',style: style);
    case 3:
      text = const Text('valle',style: style);
    case 4:
      text = const Text('min',style: style);
    case 5:
      text = const Text('total',style: style);
      break;
    default:
      text = const Text('total',style: style);
      break;
  }
  
  return SideTitleWidget(child: text, axisSide: meta.axisSide);

}
