import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexceed/Cards/EvaluateQuestions/EvaluateSlider.dart';
import 'package:rexceed/Cards/View%20af%20tr%C3%A6ning/OwnNote.dart';
import 'package:rexceed/Cards/View_af_parameter/FillingCircel.dart';
import 'package:rexceed/Cards/View_af_parameter/SleepCard.dart';
import 'package:rexceed/Cards/View%20af%20tr%C3%A6ning/ToTrainer.dart';
import 'package:rexceed/Cards/appbar.dart';
import 'package:rexceed/Helpers/appColors.dart';
import 'package:rexceed/Provider/Parameter.dart';
import '../Provider/Trainings.dart';

class ViewSide extends StatefulWidget {
  DateTime day;
  ViewSide({required this.day});
  @override
  State<ViewSide> createState() => _ViewSideState();
}

List<String> pics = [
  'Emoji_smile',
  'Slightly_smile',
  'meh_emoji',
  'sad',
  'Crying_emoji'
];
double LHeigth = 0.15;
double BHeigth = 0.2;
double BWidth = 0.9;

class _ViewSideState extends State<ViewSide> {
  Vitals _vital =
      Vitals(day: DateTime.now(), sleepHour: 0, stressLevel: 0, waterintake: 0);
  //
  Vitals _vital2 =
      Vitals(day: DateTime.now(), sleepHour: 0, stressLevel: 0, waterintake: 0);
  //
  Vitals _vital3 =
      Vitals(day: DateTime.now(), sleepHour: 0, stressLevel: 0, waterintake: 0);
  Vitals _vital4 =
      Vitals(day: DateTime.now(), sleepHour: 0, stressLevel: 0, waterintake: 0);
  //
  Training _training = Training(
      TypeOfTraining: '',
      Concentration: 0,
      Desire: 0,
      Overall: 0,
      day: DateTime.now(),
      Note: '',
      ToTrainer: '');
  @override
  Widget build(BuildContext context) {
    List<double> _hourSleep = [];
    _hourSleep.clear();
    List<DateTime> datoer = [
      widget.day.add(const Duration(hours: 22)),
      widget.day.subtract(const Duration(hours: 2)),
      widget.day.subtract(const Duration(hours: 26)),
      widget.day.subtract(const Duration(hours: 50)),
    ];
    for (var i = 0;
        i <
            Provider.of<TrainingEvalueted>(context, listen: false)
                .trainings
                .length;
        i++) {
      if (Provider.of<TrainingEvalueted>(context, listen: false)
              .trainings[i]
              .day ==
          widget.day) {
        _training =
            Provider.of<TrainingEvalueted>(context, listen: false).trainings[i];
      }
    }
    for (int i = 0;
        i < Provider.of<VitalParameters>(context, listen: false).Vital.length;
        i++) {
      if (Provider.of<VitalParameters>(context, listen: false).Vital[i].day ==
          widget.day) {
        _vital = Provider.of<VitalParameters>(context, listen: false).Vital[i];
      }
    }
    for (int i = 0;
        i < Provider.of<VitalParameters>(context, listen: false).Vital.length;
        i++) {
      if (Provider.of<VitalParameters>(context, listen: false).Vital[i].day ==
          datoer[1]) {
        _vital2 = Provider.of<VitalParameters>(context, listen: false).Vital[i];
      }
    }
    for (int i = 0;
        i < Provider.of<VitalParameters>(context, listen: false).Vital.length;
        i++) {
      if (Provider.of<VitalParameters>(context, listen: false).Vital[i].day ==
          datoer[2]) {
        _vital3 = Provider.of<VitalParameters>(context, listen: false).Vital[i];
      }
    }
    for (int i = 0;
        i < Provider.of<VitalParameters>(context, listen: false).Vital.length;
        i++) {
      if (Provider.of<VitalParameters>(context, listen: false).Vital[i].day ==
          datoer[3]) {
        _vital4 = Provider.of<VitalParameters>(context, listen: false).Vital[i];
      }
    }
    _hourSleep.clear();
    _hourSleep.add(_vital.sleepHour);
    _hourSleep.add(_vital2.sleepHour);
    _hourSleep.add(_vital3.sleepHour);
    _hourSleep.add(_vital4.sleepHour);
    print(Provider.of<VitalParameters>(context, listen: false).Vital[12].day);
    print(datoer);
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.sort,
      appBar: MainAppBar(),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AutoSizeText(
                      '${_training.TypeOfTraining} den: ${widget.day.day}/${widget.day.month}',
                      style: const TextStyle(
                          color: AppColors.textColor, fontSize: 35),
                    ),
                  )
                ],
              ),
              EVSliderQ(
                  question: 'Træningen overordnet',
                  number: _training.Overall,
                  viewside: true),
              EVSliderQ(
                  question: 'Træningens koncentration',
                  number: _training.Concentration,
                  viewside: true),
              EVSliderQ(
                  question: 'Trænings lysten',
                  number: _training.Desire,
                  viewside: true),
              SleepCard(datoer: datoer, sleepHours: _hourSleep, text: 'text'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FillingCircel(
                        backgroundColor: Colors.transparent,
                        progress: 2.5 / 3,
                        size: MediaQuery.of(context).size.width * 0.3,
                        progressColor: Color.fromARGB(255, 16, 94, 238),
                      )),
                  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FillingCircel(
                        backgroundColor: Colors.transparent,
                        progress: 10 / 100,
                        size: MediaQuery.of(context).size.width * 0.3,
                        progressColor: AppColors.clarit,
                      )),
                  Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: FillingCircel(
                        backgroundColor: Colors.transparent,
                        progress: 75 / 100,
                        size: MediaQuery.of(context).size.width * 0.3,
                        progressColor: AppColors.Main_color,
                      )),
                ],
              ),
              Visibility(
                visible: _training.Note.isNotEmpty,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: OwnNote(
                      Note: _training.Note,
                    )),
              ),
              Visibility(
                visible: _training.ToTrainer.isNotEmpty,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: TotrainerNote(
                      TotrainerN: _training.ToTrainer,
                    )),
              ),
            ],
          )),
    ));
  }
}
