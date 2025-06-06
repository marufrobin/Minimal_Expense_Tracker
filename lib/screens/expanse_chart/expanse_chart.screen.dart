import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/expanse_bloc/expanse_bloc.dart';

class ExpanseChartScreen extends StatelessWidget {
  const ExpanseChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final double barWidth = 28;
    final double barsSpace = 16;
    return SizedBox(
      height: 300,
      width: width,
      child: BlocBuilder<ExpanseBloc, ExpanseState>(
        builder: (context, state) {
          if (state is ExpenseLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ExpenseError) {
            return const Center(child: Text('Error'));
          } else if (state is ExpenseLoaded) {
            final data = state.expenses
                .map(
                  (e) => BarChartDataModel(
                    x: BarChartDataModel().daysNumber(e.dayName ?? ''),
                    y: e.amount?.toDouble(),
                  ),
                )
                .toList();
            return BarChart(
              BarChartData(
                barGroups: _barChartDataBuilder(
                  data: data,
                  theme: theme,
                  barsSpace: barsSpace,
                  barWidth: barWidth,
                ),
                borderData: _borderDesign(theme),
                titlesData: _charBorderDataLabel(),

                /// Hides the chart background grid lines.
                gridData: FlGridData(show: false),
              ),
            );
          } else {
            return const Center(child: Text('No data'));
          }
        },
      ),
    );
  }

  /// [BarChartGroupData] builder for the chart
  List<BarChartGroupData> _barChartDataBuilder({
    required List<BarChartDataModel> data,
    required ThemeData theme,
    required double barWidth,
    required double barsSpace,
  }) {
    return List.generate(data.length, (index) {
      final singleData = data[index];
      return BarChartGroupData(
        x: singleData.x ?? 0,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            toY: singleData.y ?? 0,
            borderRadius: BorderRadius.circular(4),
            width: barWidth,
            color: theme.colorScheme.primary,
            backDrawRodData: BackgroundBarChartRodData(
              color: Colors.grey.shade300,
              show: true,
              toY: 100,
            ),
          ),
        ],
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

  /// returns int from day name
  int daysNumber(String day) {
    switch (day.toLowerCase()) {
      case 'sun':
        return 0;
      case 'mon':
        return 1;
      case 'tue':
        return 2;
      case 'wed':
        return 3;
      case 'thu':
        return 4;
      case 'fri':
        return 5;
      case 'sat':
        return 6;
      case 'sunday':
        return 0;
      case 'monday':
        return 1;
      case 'tuesday':
        return 2;
      case 'wednesday':
        return 3;
      case 'thursday':
        return 4;
      case 'friday':
        return 5;
      case 'saturday':
        return 6;
      default:
        return 0;
    }
  }
}
