import 'dart:collection';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_demo/Widgets/BarGraph/bar_graph.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body:Center(
        child: SizedBox(
            height: 200,//height de la box del graph
            width: 400,
            child: MyBarGraph(
              dailySummary: dailySummary,
            )),
      )

    );
  }
}
