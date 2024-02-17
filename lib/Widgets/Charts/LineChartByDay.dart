import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_demo/Beans/ConsumationDayBean.dart';
import 'package:intl/intl.dart';

class LineChartByDay extends StatefulWidget {
  final ConsumationDayBean consumationDayBean;
  const LineChartByDay({super.key, required this.consumationDayBean});

  @override
  State<LineChartByDay> createState() => _LineChartByDayState();
}

class _LineChartByDayState extends State<LineChartByDay> {
  List<FlSpot> dummyData1 = List.generate(24, (index) {
    return FlSpot(index.toDouble(), 0);
  });
  List<FlSpot> dummyData2 = List.generate(24, (index) {
    return FlSpot(index.toDouble(), 0);
  });
  NumberFormat formatter = new NumberFormat("00");

  @override
  void initState() {
    setState(() {
      dummyData1 = List.generate(24, (index) {
        return FlSpot(
            index.toDouble(), widget.consumationDayBean.prices[index]);
      });
      dummyData2 = List.generate(24, (index) {
        return FlSpot(
            index.toDouble(), widget.consumationDayBean.consumptions[index]);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 400,
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: LineChart(
              LineChartData(
                titlesData: FlTitlesData(
                  leftTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  // The red line
                  LineChartBarData(
                    spots: dummyData1,
                    isCurved: true,
                    barWidth: 3,
                    color: Colors.indigo,
                  ),
                  LineChartBarData(
                    spots: dummyData2,
                    isCurved: true,
                    barWidth: 3,
                    color: Colors.red,
                  ),
                  // The orange line
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
