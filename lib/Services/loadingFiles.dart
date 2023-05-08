import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexceed/Provider/Trainings.dart';
import 'package:rexceed/Services/GetTheTrainingData.dart';
import 'package:rexceed/main.dart';

class SplashPage extends StatefulWidget {
  int? duration = 0;
  String? gotopage;

  SplashPage({this.duration, this.gotopage});
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    TrainingService trainingService =
        Provider.of<TrainingService>(context, listen: false);

    trainingService.getDatafromFirebase().then((value) async {
      for (int i = 0;
          i <
              await Provider.of<TrainingService>(context, listen: false)
                  .getLength();
          i++) {
        Provider.of<TrainingEvalueted>(context, listen: false)
            .trainings
            .add(trainingService.getTraingings()[i]);
      }
      //navigatorKey.currentState!.popAndPushNamed(widget.gotopage!);
      navigatorKey.currentState!.pushNamed(widget.gotopage!);
    });
    return Center(child: CircularProgressIndicator());
  }
}
