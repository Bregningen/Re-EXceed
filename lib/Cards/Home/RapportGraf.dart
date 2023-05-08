import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';
import 'package:rexceed/Helpers/appColors.dart';
import 'package:provider/provider.dart';

import 'cirkeldiagramForklaring.dart';

double strokeWidth = 0.8;

class RapportGraf extends StatefulWidget {
  double smile;
  double slight_smile;
  double meh;
  double sad;
  double crying;
  RapportGraf(
      {required this.meh,
      required this.crying,
      required this.sad,
      required this.slight_smile,
      required this.smile});
  @override
  State<RapportGraf> createState() => _RapportGrafState();
}

class _RapportGrafState extends State<RapportGraf> {
  @override
  Widget build(BuildContext context) {
    List<Data> data = [
      Data(color: graphColors.sad, name: 'Sad', percent: widget.sad),
      Data(color: graphColors.crying, name: 'Crying', percent: widget.crying),
      Data(color: graphColors.meh, name: 'Meh', percent: widget.meh),
      Data(
          color: graphColors.sligth_smile,
          name: 'slightsmile',
          percent: widget.slight_smile),
      Data(color: graphColors.smile, name: 'Smile', percent: widget.smile)
    ];

    List<PieChartSectionData> getSections() => data
        .asMap()
        .map<int, PieChartSectionData>((index, data) {
          var value = PieChartSectionData(
            color: data.color,
            value: data.percent,
            title: '${data.percent}',
          );
          return MapEntry(index, value);
        })
        .values
        .toList();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.42,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CirkelDiagramForklaring(
                text: 'Fantatisk',
                color: graphColors.smile,
              ),
              CirkelDiagramForklaring(
                text: 'God',
                color: graphColors.sligth_smile,
              ),
              CirkelDiagramForklaring(
                text: 'OK',
                color: graphColors.meh,
              ),
              CirkelDiagramForklaring(
                text: 'Dårlig',
                color: graphColors.sad,
              ),
              CirkelDiagramForklaring(
                text: 'Ringe',
                color: graphColors.crying,
              ),
            ],
          ),
          PieChart(PieChartData(
              pieTouchData: PieTouchData(enabled: true),
              sections: getSections())),
        ],
      ),
    );
  }
}

class Data {
  String name;
  double percent;
  Color color;
  Data({required this.color, required this.name, required this.percent});
}
