import 'dart:collection';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_demo/Widgets/BarGraph/bar_graph.dart';
import 'package:project_demo/Widgets/PieChart/pie_chart_page.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<double> dailySummary = [
     94.65,
     36.24,
     39.03,
     19.39, //llano
     129.42, //max
     76.89, //min
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Vertically center the content
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
                  height: 200,
                  child: MyBarGraph(
                    dailySummary: dailySummary,
                  ),
                ),
              ),
              SizedBox(height: 16), // Add some spacing between the graphs
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 400,
                  height: 200,

                  child: MyPieChart(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}

