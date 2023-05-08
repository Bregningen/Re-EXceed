import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class _data {
  final String weekday;
  final double hour;
  _data({required this.weekday, required this.hour});
}

List<_data> Sleep = [
  _data(weekday: 'Mandag', hour: 7.8),
  _data(weekday: 'Tirsdag', hour: 8.5),
  _data(weekday: 'Onsdag', hour: 7.5),
  _data(weekday: 'Torsdag', hour: 8),
  _data(weekday: 'Fredag', hour: 9),
  _data(weekday: 'Lørdag', hour: 0),
  _data(weekday: 'Søndag', hour: 0),
];

class Slepp_Home extends StatefulWidget {
  const Slepp_Home({Key? key}) : super(key: key);

  @override
  State<Slepp_Home> createState() => _Slepp_HomeState();
}

class _Slepp_HomeState extends State<Slepp_Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height / 2.8,
          child: DecoratedBox(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: SfCartesianChart(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                primaryXAxis: CategoryAxis(),
                series: <ChartSeries<_data, String>>[
                  ColumnSeries(
                      dataSource: Sleep,
                      xValueMapper: (_data data, _) => data.weekday,
                      yValueMapper: (_data data, _) => data.hour,
                      name: 'Søvn',
                      dataLabelSettings:
                          const DataLabelSettings(isVisible: true),
                      yAxisName: 'Timers søvn',
                      color: Color.fromARGB(255, 221, 60, 221)),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.93,
          child: DecoratedBox(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Indtast din søvn ',
                  style: TextStyle(fontSize: 20),
                ),
              )),
        )
      ],
    );
  }
}
