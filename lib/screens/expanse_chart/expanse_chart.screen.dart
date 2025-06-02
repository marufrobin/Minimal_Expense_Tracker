import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpanseChartScreen extends StatelessWidget {
  const ExpanseChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final List<BarChartDataModel> data = [
      BarChartDataModel(x: 0, y: 10),
      BarChartDataModel(x: 1, y: 20),
      BarChartDataModel(x: 2, y: 30),
      BarChartDataModel(x: 3, y: 40),
      BarChartDataModel(x: 4, y: 50),
      BarChartDataModel(x: 5, y: 60),
      BarChartDataModel(x: 6, y: 70),
      BarChartDataModel(x: 7, y: 80),
      BarChartDataModel(x: 8, y: 90),
      BarChartDataModel(x: 9, y: 100),
    ];
    return SizedBox(
      height: 300,
      width: width,
      child: BarChart(
        BarChartData(
          barGroups: List.generate(data.length, (index) {
            final singleData = data[index];
            return BarChartGroupData(
              x: singleData.x ?? 0,
              barRods: [BarChartRodData(toY: singleData.y ?? 0)],
            );
          }),
        ),
      ),
    );
  }
}

class BarChartDataModel {
  final int? x;
  final double? y;

  BarChartDataModel({this.x, this.y});
}
