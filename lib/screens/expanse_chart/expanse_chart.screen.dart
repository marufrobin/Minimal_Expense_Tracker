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
      height: 400,
      width: width,
      child: BarChart(
        BarChartData(
          barGroups: _barChartDataBuilder(data),
          borderData: _borderDesign(theme),
          titlesData: _charBorderDataLabel(),

          /// Hides the chart background grid lines.
          gridData: FlGridData(show: false),
        ),
      ),
    );
  }

  /// [BarChartGroupData] builder for the chart
  List<BarChartGroupData> _barChartDataBuilder(List<BarChartDataModel> data) {
    return List.generate(data.length, (index) {
      final singleData = data[index];
      return BarChartGroupData(
        x: singleData.x ?? 0,
        barRods: [BarChartRodData(toY: singleData.y ?? 0)],
      );
    });
  }

  FlTitlesData _charBorderDataLabel() {
    return FlTitlesData(
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          getTitlesWidget: (value, meta) =>
              Text(BarChartDataModel().daysName(value.toInt())),
          showTitles: true,
        ),
      ),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

  /// [Chart_Border] design for the chart
  FlBorderData _borderDesign(ThemeData theme) {
    return FlBorderData(
      border: Border(
        left: BorderSide(color: theme.dividerColor),
        bottom: BorderSide(color: theme.dividerColor),
      ),
    );
  }
}

class BarChartDataModel {
  final int? x;
  final double? y;

  BarChartDataModel({this.x, this.y});

  String daysName(int days) {
    switch (days % 7) {
      case 0:
        return 'Sun';
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      default:
        return '';
    }
  }
}
