import 'dart:collection';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_demo/WebServices/WebServices.dart';
import 'package:project_demo/Widgets/BarGraph/bar_graph.dart';
import 'package:project_demo/Widgets/PieChart/PieChart.dart';


class DashboardPage extends StatefulWidget {
  final String bill_id;
  const DashboardPage({super.key, required this.bill_id});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<double> dailySummary = [];
  List<ChartData> chartData = [];

  @override
  void initState() {
    getDashbordInfo();
    // TODO: implement initState
    super.initState();
  }

  getDashbordInfo() async {
    Map<String, dynamic> infoExpenses = await WebService().getExpenses(widget.bill_id);
    print(infoExpenses);
    dailySummary = [infoExpenses["total"],infoExpenses["punta"],infoExpenses["valle"],infoExpenses["llano"],infoExpenses["max"],infoExpenses["min"]];
    Map<String, dynamic> infoSources = await WebService().getSources(widget.bill_id);
    chartData = [      ChartData('Renobable', infoSources["renewable"]),
      ChartData('Gran Eficiencia', infoSources["highEfficiency"]),
      ChartData('Natural Gas', infoSources["naturalGas"]),
      ChartData('Carbon', infoSources["coal"]),
      ChartData('Gas', infoSources["fuel"]),
      ChartData('Nuclear',infoSources["nuclear"]),
      ChartData('Gran Eficiencia', infoSources["otherNonRenewable"])];
    print(infoSources);
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
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

                    child: MyPieChart( info: chartData,),
                  ),
                ),
              ],
            ),
          ),
      );
  }


}

