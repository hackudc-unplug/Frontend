import 'package:flutter/material.dart';
import 'package:project_demo/Beans/ConsumationDayBean.dart';
import 'package:project_demo/WebServices/WebServices.dart';
import 'package:project_demo/Widgets/Charts/LineChartByDay.dart';
import 'package:project_demo/Widgets/Charts/LineChartByYear.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  ConsumationDayBean consumationDayBean = ConsumationDayBean.empty();
  bool isLoading = true;

  @override
  void initState() {
    changeToDialy();
    super.initState();
  }

  late Widget linearChart;

  changeToDialy() async {
    setState(() {
      isLoading = true;
    });
    DateTime now = DateTime.now();
    ConsumationDayBean consumationDayBeaResponse =
        await WebService().getConsumationsByDay(now.day, now.month, now.year);

    print("data" + consumationDayBeaResponse.toString());
    setState(() {
      consumationDayBean = consumationDayBeaResponse;
      linearChart = LineChartByDay(
        consumationDayBean: consumationDayBean,
      );
      isLoading = false;
    });
  }

  changeToMonthly() async {
    setState(() {
      isLoading = true;
    });
    DateTime now = DateTime.now();
    ConsumationDayBean consumationDayBeaResponse =
        await WebService().getConsumationsByMonth(now.day, now.month, now.year);

    print("data" + consumationDayBeaResponse.toString());
    setState(() {
      consumationDayBean = consumationDayBeaResponse;
      linearChart = LineChartByDay(
        consumationDayBean: consumationDayBean,
      );
      isLoading = false;
    });
  }

  changeToWeek() async {
    setState(() {
      isLoading = true;
    });
    DateTime now = DateTime.now();
    ConsumationDayBean consumationDayBeaResponse =
        await WebService().getConsumationsWeek(now.day, now.month, now.year);

    print("data" + consumationDayBeaResponse.toString());
    setState(() {
      consumationDayBean = consumationDayBeaResponse;
      linearChart = LineChartByYear(
        consumationDayBean: consumationDayBean,
      );
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(
                    child: Column(
                      children: [
                        linearChart,
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  child: const Text('Day'),
                                  onPressed: () {
                                    changeToDialy();
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  child: const Text('Week'),
                                  onPressed: () {
                                    changeToWeek();
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  child: const Text('Month'),
                                  onPressed: () {
                                    changeToMonthly();
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 200,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width:2,
                              color: Colors.grey),
                              borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
          ),

        ],
      ),
    );
  }
}
