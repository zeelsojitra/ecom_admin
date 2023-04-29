import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../common_screen/Comman_Container.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  Map<String, double> datamap = {
    "User": 5,
    "Seller": 10,
    "Product": 15,
  };
  @override
  Widget build(BuildContext context) {
    return Comman_Container(
      child: PieChart(
        dataMap: datamap,
        chartRadius: 300,
        legendOptions: LegendOptions(
          legendPosition: LegendPosition.bottom,
        ),
        chartValuesOptions: ChartValuesOptions(
          showChartValuesInPercentage: true,
        ),
      ),
    );
  }
}
