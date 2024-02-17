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
  String largeString = '''
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tincidunt dui non mauris rutrum, quis posuere lacus fermentum. Sed semper risus nec est ullamcorper luctus. Integer elementum magna nec enim varius, vitae vehicula risus lobortis. Pellentesque convallis euismod magna, non varius ante consequat vitae. In hac habitasse platea dictumst. Maecenas non orci et nulla dictum commodo. Nam eleifend, urna id varius bibendum, orci elit laoreet ex, ac eleifend elit dui ac est. Nulla facilisi. Sed at nisl tortor. Nam nec lacus tincidunt, lobortis velit ut, ullamcorper nisi. Morbi consequat vitae magna sit amet ultricies. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
    
    Nullam a orci eu nisi auctor pellentesque. Donec ullamcorper luctus tellus, nec accumsan elit vestibulum sit amet. Phasellus efficitur nisi eu magna efficitur, a tincidunt lectus ultrices. Phasellus viverra nunc nunc, sed sagittis risus malesuada sit amet. Curabitur sit amet tellus ex. Maecenas non justo vel nisl malesuada vestibulum. Cras eget justo quis risus tempus pellentesque id at lacus. Integer id sagittis ex. Nam sed lacus nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut nec vehicula nulla. Proin vitae dui orci. Integer sit amet eros nec elit sollicitudin gravida. Proin sed lectus tortor.
    
    Fusce ut sollicitudin eros. Fusce tincidunt orci ac velit condimentum, nec consequat quam vulputate. Integer vulputate, enim in luctus ultricies, nulla magna venenatis quam, in mattis lorem ex a risus. Vestibulum ullamcorper metus non justo auctor interdum. Mauris vitae eros risus. Suspendisse non ex vitae est dignissim vehicula id in quam. Vestibulum mattis, risus quis aliquet lobortis, ipsum nisl gravida mi, at tempor eros leo at lectus. Fusce eget eros vitae urna pretium fringilla ut a libero. Curabitur condimentum orci at odio tempus, vitae interdum turpis fermentum. Curabitur faucibus felis quis erat placerat, vitae consectetur ligula congue.
    
    Proin in nibh augue. Proin tincidunt quam ac massa laoreet, et hendrerit justo suscipit. Sed malesuada efficitur purus at suscipit. Nam sagittis semper nunc eget luctus. Nulla facilisi. Nullam sed urna non ligula venenatis rutrum et eget felis. Donec ullamcorper ex nec lacus interdum ultricies. Vestibulum lacinia suscipit turpis, ut fermentum ex fermentum nec. Praesent tempus arcu non purus luctus, nec consequat arcu vehicula. Integer in sapien orci. Phasellus varius scelerisque ultricies. Vivamus elementum nisi nec eros mattis, eget tempus mauris interdum. Nulla laoreet convallis dui eget fringilla. Curabitur auctor sodales sem, sed laoreet libero eleifend nec.
    
    Sed sed venenatis erat, vel euismod quam. Integer sit amet sodales eros, in dapibus nisl. Curabitur mollis ut ligula at tempor. Suspendisse potenti. Sed non lacinia urna. Aenean sodales, nulla vitae ultricies consectetur, sem odio iaculis odio, nec fermentum eros eros nec nulla. Nullam sit amet mi magna. Nam nec nisi eu libero blandit hendrerit. Vestibulum sollicitudin, arcu nec tincidunt faucibus, tortor mi tincidunt tellus, ut auctor libero tellus a lorem. Maecenas a nisl id dolor tincidunt placerat. Maecenas sed urna lorem. Maecenas ac urna et dolor rhoncus fringilla. Vivamus quis luctus arcu, id tempus velit. Phasellus condimentum bibendum pretium. Duis ullamcorper purus euismod urna dictum, eget faucibus ligula pharetra.
    
    Quisque suscipit felis sed tellus malesuada, sit amet egestas eros rutrum. Maecenas quis ligula eros. Duis tempor, justo vel mattis tincidunt, nunc dui blandit nulla, id iaculis justo velit ac libero. Proin ut tincidunt velit. Suspendisse potenti. Mauris finibus est nec nunc tempor interdum. Morbi sodales mauris eget nulla vulputate, nec suscipit dolor fringilla. Nam nec varius quam. Cras ullamcorper nibh id pharetra consectetur. Vivamus sit amet tellus tempor, bibendum eros eget, vehicula odio. Curabitur accumsan, sem id molestie tempor, ex dolor interdum quam, et tristique magna orci vel dui.
    
    Curabitur vulputate metus nec ante suscipit varius. Duis tincidunt sodales nisi at scelerisque. Suspendisse eget tempor justo. Donec venenatis tincidunt eros. Maecenas nec feugiat velit. Sed gravida vel nisi vitae tempus. Nullam vitae consequat velit. Sed eget eros sit amet metus eleifend gravida. Phasellus malesuada metus justo, non eleifend lorem lobortis nec. Nam ut nisl ac eros laoreet interdum vel eu ligula. Curabitur ut tincidunt velit. Integer sed tortor nulla. Ut placerat velit nec velit tincidunt luctus. Cras sodales, tortor vel feugiat tincidunt, turpis nulla congue purus, non tincidunt purus lorem id orci. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Ut sed mauris velit. Suspendisse quis libero eget lacus blandit scelerisque. Sed nec arcu bibendum, molestie ligula non, suscipit dolor.
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
