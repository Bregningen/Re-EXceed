import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rexceed/Helpers/appColors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SleepCard extends StatefulWidget {
  List<DateTime> datoer;
  List<double> sleepHours;
  String text;

  SleepCard(
      {required this.datoer, required this.sleepHours, required this.text});

  @override
  State<SleepCard> createState() => _SleepCardState();
}

class _SleepCardState extends State<SleepCard> {
  @override
  Widget build(BuildContext context) {
    List<_data> sleep = [
      _data(
          sleepHour: widget.sleepHours[3],
          dato:
              '${widget.datoer[3].day}/${widget.datoer[3].month}/${widget.datoer[3].year}'),
      _data(
          sleepHour: widget.sleepHours[2],
          dato:
              '${widget.datoer[2].day}/${widget.datoer[2].month}/${widget.datoer[2].year}'),
      _data(
          sleepHour: widget.sleepHours[1],
          dato:
              '${widget.datoer[1].day}/${widget.datoer[1].month}/${widget.datoer[1].year}'),
      _data(
          sleepHour: widget.sleepHours[0],
          dato:
              '${widget.datoer[0].day}/${widget.datoer[0].month}/${widget.datoer[0].year}'),
    ];
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      child: SfCartesianChart(
          primaryYAxis: CategoryAxis(
              title: AxisTitle(
                  text: 'Søvn timer',
                  textStyle: const TextStyle(color: AppColors.textColor)),
              labelStyle: const TextStyle(color: AppColors.textColor)),
          primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0),
              labelStyle: const TextStyle(color: AppColors.textColor)),
          series: <ChartSeries<_data, String>>[
            ColumnSeries(
                color: AppColors.Main_color,
                dataSource: sleep,
                xValueMapper: (_data data, _) => data.dato,
                yValueMapper: (_data data, _) => data.sleepHour,
                name: 'Søvn')
          ]),
    );
  }
}

class _data {
  final String dato;
  final double sleepHour;
  _data({required this.dato, required this.sleepHour});
}
