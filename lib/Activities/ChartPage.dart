import 'package:flutter/material.dart';
import 'package:project_demo/Beans/ConsumationDayBean.dart';
import 'package:project_demo/Utils/ResponseDecoder.dart';
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
    setState(()  {
      consumationDayBean = consumationDayBeaResponse;
      linearChart = LineChartByDay(
        consumationDayBean: consumationDayBean,
      );
      isLoading = false;
    });

    ResponseDecoder rd = await WebService().getTip(consumationDayBean.prices, consumationDayBean.consumptions);
    print(rd.toString());

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
  String largeString = '''
    Here are some tips to help you reduce your electricity bill by adjusting your consumption to cheaper hours:

1.
Move high consumption from the most expensive hours (17, 0, 14) to cheaper hours like [23, 16, 22]. For example, consider moving your evening TV show from 7 pm to 11 pm, when electricity rates are lower.

2.
Identify the most consumed hours (4, 23, 12) and see if there's anything you can do to reduce usage during those times. For instance, consider rescheduling your daily morning coffee session to a later time when you're not rushing to get to work or school.

3.
Focus on reducing consumption during the least expensive hours ([19, 7, 0]). Consider using energy-efficient appliances and turning off appliances that are not in use, such as lights and televisions, when you leave a room.

By following these tips, you can not only lower your electricity costs but also help conserve energy and reduce your carbon footprint.
    ''';

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
                          child: Column(
                            children: [
                              SizedBox(
                                height: 200,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width:2,
                                    color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        largeString,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),

                                ),
                              ),
                            ],
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
