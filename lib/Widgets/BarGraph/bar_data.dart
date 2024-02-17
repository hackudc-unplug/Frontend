import 'individual_bar_graph.dart';

class BarData {
  final double min;
  final double llano;
  final double max;
  final double total;
  final double punta;
  final double valle;

  BarData({
    required this.llano,
    required this.min,
    required this.max,
    required this.punta,
    required this.total,
    required this.valle,
  });

  List<IndividualBar> barData = [];

  void initializeBarData() {
    barData = [
      //min
      IndividualBar(x: 0, y: total),
      IndividualBar(x: 1, y: llano),
      IndividualBar(x: 2, y: min),
      IndividualBar(x: 3, y: max),
      IndividualBar(x: 4, y: punta),
      IndividualBar(x: 5, y: valle),

    ];
  }

}