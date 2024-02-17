import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyPieChart extends StatefulWidget {
  final  List<ChartData> info;
  const MyPieChart({super.key, required this.info});

  @override
  State<MyPieChart> createState() => _MyPieChartState();
}

class _MyPieChartState extends State<MyPieChart> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = widget.info;
    return Scaffold(
        body: Center(
            child: Container(
                child: SizedBox(
                  child: SfCircularChart(
                      legend:Legend(isVisible: true) ,
                      series: <CircularSeries>[
                        // Render pie chart
                        PieSeries<ChartData, String>(
                            dataSource: chartData,
                            pointColorMapper:(ChartData data,  _) => data.color,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y

                        )
                      ]
                  ),
                )
            )
        )
    );
  }

}
class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}

