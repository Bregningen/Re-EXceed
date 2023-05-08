// ignore_for_file: prefer_const_constructors
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rexceed/Cards/View_af_parameter/FillingCircel.dart';
import 'package:rexceed/Cards/appbar.dart';
import 'package:rexceed/Helpers/appColors.dart';
import 'package:rexceed/Provider/Other.dart';
import 'package:rexceed/Provider/Trainings.dart';
import 'package:rexceed/Services/GetTheTrainingData.dart';
import 'package:rexceed/sider/Viewside.dart';
import 'package:rexceed/sider/evaluate.dart';
import 'package:rexceed/sider/exercise.dart';
import 'package:rexceed/sider/parametre.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';

import '../Cards/Home/RapportGraf.dart';
import '../Provider/Parameter.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

double pad = 5;
DateTime show = DateTime.now();

// ignore: non_constant_identifier_names
int ColorId = 5;

List<Color> colors = [
  graphColors.smile,
  graphColors.sligth_smile,
  graphColors.meh,
  graphColors.sad,
  graphColors.crying,
  Colors.transparent
];
List<DateTime> smiles = [];
List<DateTime> sligth_smile = [];
List<DateTime> meh = [];
List<DateTime> sad = [];
List<DateTime> cry = [];

class _HomeState extends State<Home> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void _onDaySelected(DateTime day, DateTime focusedDay) async {
    if (smiles.contains(focusedDay) ||
        sligth_smile.contains(focusedDay) ||
        meh.contains(focusedDay) ||
        sad.contains(focusedDay) ||
        // ignore: iterable_contains_unrelated_type
        cry.contains(focusedDay)) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewSide(
              day: day,
            ),
          ));
      setState(() {});
      smiles.clear();
      sligth_smile.clear();
      meh.clear();
      sad.clear();
      cry.clear();
    } else {
      await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Evaluate(
              day: day,
            ),
          ));
      smiles.clear();
      sligth_smile.clear();
      meh.clear();
      sad.clear();
      cry.clear();
      setState(() {
        String dagenIdag = show.toIso8601String();
        List<String> Sdagenidag = dagenIdag.split('T');

        for (int i = 0;
            i <
                Provider.of<TrainingEvalueted>(context, listen: false)
                    .trainings
                    .length;
            i++) {
          String sammenlign =
              Provider.of<TrainingEvalueted>(context, listen: false)
                  .trainings[i]
                  .day
                  .toIso8601String();
          List<String> Ssammenlign = sammenlign.split('T');
          if (Sdagenidag[0] == Ssammenlign[0]) {
            ColorId = Provider.of<TrainingEvalueted>(context, listen: false)
                .trainings[i]
                .Overall;
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0;
        i <
            Provider.of<TrainingEvalueted>(context, listen: false)
                .trainings
                .length;
        i++) {
      if (Provider.of<TrainingEvalueted>(context, listen: false)
              .trainings[i]
              .Overall ==
          0) {
        smiles.add(Provider.of<TrainingEvalueted>(context).trainings[i].day);
      }
      if (Provider.of<TrainingEvalueted>(context, listen: false)
              .trainings[i]
              .Overall ==
          1) {
        sligth_smile
            .add(Provider.of<TrainingEvalueted>(context).trainings[i].day);
      }
      if (Provider.of<TrainingEvalueted>(context, listen: false)
              .trainings[i]
              .Overall ==
          2) {
        meh.add(Provider.of<TrainingEvalueted>(context).trainings[i].day);
      }
      if (Provider.of<TrainingEvalueted>(context, listen: false)
              .trainings[i]
              .Overall ==
          3) {
        sad.add(Provider.of<TrainingEvalueted>(context).trainings[i].day);
      }
      if (Provider.of<TrainingEvalueted>(context, listen: false)
              .trainings[i]
              .Overall ==
          4) {
        cry.add(Provider.of<TrainingEvalueted>(context, listen: false)
            .trainings[i]
            .day);
      }
    }
    const double textSizeDrawer = 25;
    return SafeArea(
      child: Scaffold(
          endDrawer: Drawer(
            width: MediaQuery.of(context).size.width * 0.5,
            backgroundColor: AppColors.Main_color,
            child: ListView(
                shrinkWrap: true,
                children: ListTile.divideTiles(
                    color: AppColors.clarit,
                    context: context,
                    tiles: [
                      ListTile(
                        title: const Text('Parametre',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: textSizeDrawer)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ParametreSide()));
                        },
                      ),
                      ListTile(
                        onTap: () {},
                        title: Row(
                          children: const [
                            SizedBox(
                              child: AutoSizeText(
                                'Skade kalender',
                                style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: textSizeDrawer),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        title: Row(
                          children: const [
                            Text(
                              'Månedlig rapport',
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: textSizeDrawer),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => const Exercise())));
                        },
                        title: Row(
                          children: const [
                            Text(
                              'Træningsprogrammer',
                              style: TextStyle(
                                  color: AppColors.textColor,
                                  fontSize: textSizeDrawer),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        title: const Text('Test dig selv',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: textSizeDrawer)),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Dit hold',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: textSizeDrawer)),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Stress',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: textSizeDrawer)),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Bliv klogere på restitution',
                            style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: textSizeDrawer)),
                        onTap: () {},
                      ),
                      ListTile(
                        title: Row(
                          children: const [
                            Text(
                              'Premium',
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: textSizeDrawer),
                            ),
                            Icon(Icons.star, color: Colors.amber),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Row(children: const [
                          Text(
                            'sign-out',
                            style: TextStyle(
                                color: Colors.white, fontSize: textSizeDrawer),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.logout_outlined,
                              color: AppColors.white,
                            ),
                          )
                        ]),
                        onTap: (() {
                          setState(() {
                            FirebaseAuth.instance.signOut();
                          });
                        }),
                      )
                    ]).toList()),
          ),
          appBar: MainAppBar(backButton: false),
          backgroundColor: AppColors.sort,
          body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(pad),
                    child: RapportGraf(
                      smile: smiles.length.toDouble(),
                      slight_smile: sligth_smile.length.toDouble(),
                      meh: meh.length.toDouble(),
                      sad: sad.length.toDouble(),
                      crying: cry.length.toDouble(),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TableCalendar(
                      calendarBuilders: CalendarBuilders(
                          defaultBuilder: ((context, day, focusday) {
                        //smile

                        for (DateTime d in smiles) {
                          if (day.day == d.day &&
                              day.month == d.month &&
                              day.year == d.year &&
                              day.hour == d.hour) {
                            return Container(
                              width: 35,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: graphColors.smile),
                              child: Center(
                                child: Text(
                                  '${day.day}',
                                  style: TextStyle(color: AppColors.textColor),
                                ),
                              ),
                            );
                          }
                        }
                        //slight smile
                        for (DateTime d in sligth_smile) {
                          if (day.day == d.day &&
                              day.month == d.month &&
                              day.year == d.year) {
                            return Container(
                              width: 35,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: graphColors.sligth_smile),
                              child: Center(
                                child: Text(
                                  '${day.day}',
                                  style: TextStyle(color: AppColors.textColor),
                                ),
                              ),
                            );
                          }
                        } //meh
                        for (DateTime d in meh) {
                          if (day.day == d.day &&
                              day.month == d.month &&
                              day.year == d.year) {
                            return Container(
                              width: 35,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: graphColors.meh),
                              child: Center(
                                child: Text(
                                  '${day.day}',
                                  style: TextStyle(color: AppColors.textColor),
                                ),
                              ),
                            );
                          }
                        } //sad
                        for (DateTime d in sad) {
                          if (day.day == d.day &&
                              day.month == d.month &&
                              day.year == d.year) {
                            return Container(
                              width: 35,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: graphColors.sad),
                              child: Center(
                                child: Text(
                                  '${day.day}',
                                  style: TextStyle(color: AppColors.textColor),
                                ),
                              ),
                            );
                          }
                        }
                        //crying
                        for (DateTime d in cry) {
                          if (day.day == d.day &&
                              day.month == d.month &&
                              day.year == d.year) {
                            return Container(
                              width: 35,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: graphColors.crying),
                              child: Center(
                                child: Text(
                                  '${day.day}',
                                  style: TextStyle(color: AppColors.textColor),
                                ),
                              ),
                            );
                          }
                        }
                        return null;
                      })),
                      daysOfWeekStyle: DaysOfWeekStyle(
                          weekdayStyle:
                              TextStyle(color: AppColors.Calendar_color),
                          weekendStyle:
                              TextStyle(color: AppColors.Calendar_color)),
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      calendarStyle: CalendarStyle(
                          //Den nuværende dag design
                          selectedDecoration: BoxDecoration(
                            color: colors[ColorId],
                            shape: BoxShape.circle,
                          ),
                          outsideTextStyle:
                              TextStyle(color: AppColors.Calendar_color),
                          weekendTextStyle:
                              TextStyle(color: AppColors.Calendar_color),
                          weekNumberTextStyle: TextStyle(color: AppColors.red),
                          defaultTextStyle:
                              TextStyle(color: AppColors.Calendar_color)),
                      headerStyle: HeaderStyle(
                          leftChevronIcon: Icon(
                            Icons.chevron_left,
                            color: AppColors.Calendar_color,
                          ),
                          rightChevronIcon: Icon(Icons.chevron_right,
                              color: AppColors.Calendar_color),
                          formatButtonVisible: false,
                          titleCentered: true,
                          titleTextStyle:
                              TextStyle(color: AppColors.Calendar_color)),
                      availableGestures: AvailableGestures.all,
                      locale: 'en_US',
                      selectedDayPredicate: ((day) => isSameDay(day, show)),
                      rowHeight: MediaQuery.of(context).size.height * 0.048,
                      focusedDay: show,
                      weekNumbersVisible: true,
                      firstDay: DateTime.utc(2023, 1, 1),
                      lastDay: DateTime.utc(2030, 10, 10),
                      onDaySelected: _onDaySelected,
                    ),
                  ),
                ],
              ))),
    );
  }
}
