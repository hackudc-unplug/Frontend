import 'dart:convert';

class ConsumationDayBean {
  final List<String> hours;
  final List<dynamic> prices;
  final List<dynamic> consumptions;

  ConsumationDayBean(
      {required this.hours, required this.prices, required this.consumptions});

  static ConsumationDayBean getByJson(Map<String, dynamic> jsonData) {
    int index = 0;
    List<dynamic> prices = jsonData["prices"];
    List<dynamic> consumptions = jsonData["consumptions"];
    List<String> hours = [];
    prices.forEach((element) {
      hours.add(
          index <= 9 ? "0${index.toString()}:00" : "${index.toString()}:00");
    });

    return ConsumationDayBean(
        hours: hours, prices: prices, consumptions: consumptions);
  }

  static ConsumationDayBean empty() {
    return ConsumationDayBean(hours: [], prices: [], consumptions: []);
  }
}
