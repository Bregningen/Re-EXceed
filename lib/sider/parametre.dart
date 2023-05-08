import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexceed/Cards/View_af_parameter/FillingCircel.dart';
import 'package:rexceed/Cards/appbar.dart';

import '../Helpers/appColors.dart';
import '../Provider/Parameter.dart';

class ParametreSide extends StatefulWidget {
  const ParametreSide({super.key});

  @override
  State<ParametreSide> createState() => _ParametreSideState();
}

class _ParametreSideState extends State<ParametreSide> {
  Vitals vital =
      Vitals(day: DateTime.now(), sleepHour: 0, stressLevel: 0, waterintake: 0);
  int h = 0;
  @override
  Widget build(BuildContext context) {
    for (int i = 0;
        i < Provider.of<VitalParameters>(context, listen: false).Vital.length;
        i++) {
      if (Provider.of<VitalParameters>(context, listen: false).Vital[i].day ==
          DateTime.now()) {
        vital = Provider.of<VitalParameters>(context, listen: false).Vital[i];
        h = i;
      }
    }
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.sort,
      appBar: MainAppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FillingCircel(
                  backgroundColor: AppColors.sort,
                  progress: vital.waterintake,
                  progressColor: Colors.lightBlue,
                  size: 200),
              Column(
                children: [
                  IconButton(
                      iconSize: 50,
                      onPressed: () {
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.add_circle_outline_rounded,
                        color: Colors.blueAccent,
                      )),
                  IconButton(
                      iconSize: 50,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove_circle_outline_outlined,
                        color: Colors.blueAccent,
                      ))
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
