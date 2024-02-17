import 'package:flutter/material.dart';
import 'package:flutter_graphs/flutter_graphs.dart';

class CustomGraph extends StatefulWidget {
  const CustomGraph({Key? key}) : super(key: key);

  @override
  State<CustomGraph> createState() => _CustomGraphState();
}

class _CustomGraphState extends State<CustomGraph> {
  late TextEditingController xController;
  late TextEditingController yController;
  List<DataPoint> dataPoints = [];

  @override
  void initState() {
    super.initState();
    xController = TextEditingController();
    yController = TextEditingController();
  }

  @override
  void dispose() {
    xController.dispose();
    yController.dispose();
    super.dispose();
  }

  void _addDataPoint() {
    double x = double.tryParse(xController.text) ?? 0.0;
    double y = double.tryParse(yController.text) ?? 0.0;
    setState(() {
      dataPoints.add(DataPoint(x, y));
      xController.clear();
      yController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Graph'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: xController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'X',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: yController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Y',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _addDataPoint,
                  child: Text('Add Point'),
                ),
              ],
            ),
          ),
          Expanded(
            child: LineGraph(
              data: [GraphSeries(dataPoints: dataPoints)],
              size: Size(300, 300),
              settings: LineGraphSettings(
                minX: 0,
                maxX: 10,
                minY: 0,
                maxY: 10,
                enableGridX: true,
                enableGridY: true,
                gridLineDashArray: [3, 3],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CustomGraph(),
  ));
}
