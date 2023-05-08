import 'package:flutter/material.dart';

class Vitals {
  DateTime day;
  double sleepHour;
  double waterintake;
  double stressLevel;

  Vitals(
      {required this.day,
      required this.sleepHour,
      required this.stressLevel,
      required this.waterintake});
}

class VitalParameters with ChangeNotifier {
  List<Vitals> Vital = [
    Vitals(
        day: DateTime(2023, 4, 22).toUtc(),
        sleepHour: 7.8,
        stressLevel: 25,
        waterintake: 2.7),
    Vitals(
        day: DateTime(2023, 4, 23).toUtc(),
        sleepHour: 7.8,
        stressLevel: 25,
        waterintake: 2.7),
    Vitals(
        day: DateTime(2023, 4, 24).toUtc(),
        sleepHour: 7.8,
        stressLevel: 25,
        waterintake: 2.7),
    Vitals(
        day: DateTime(2023, 4, 25).toUtc(),
        sleepHour: 7.8,
        stressLevel: 25,
        waterintake: 2.7),
    Vitals(
        day: DateTime(2023, 4, 26).toUtc(),
        sleepHour: 7.8,
        stressLevel: 25,
        waterintake: 2.7),
    Vitals(
        day: DateTime(2023, 4, 27).toUtc(),
        sleepHour: 7.8,
        stressLevel: 25,
        waterintake: 2.7),
    Vitals(
        day: DateTime(2023, 4, 28).toUtc(),
        sleepHour: 7.8,
        stressLevel: 25,
        waterintake: 2.7),
    Vitals(
        day: DateTime(2023, 4, 29, 00, 00).toUtc(),
        sleepHour: 7.8,
        stressLevel: 25,
        waterintake: 2.7),
    Vitals(
        day: DateTime(2023, 4, 30).toUtc(),
        sleepHour: 7.8,
        stressLevel: 25,
        waterintake: 2.7),
    Vitals(
        day: DateTime(2023, 5, 1).toUtc(),
        sleepHour: 7.8,
        stressLevel: 25,
        waterintake: 2.7),
    Vitals(
        day: DateTime(2023, 5, 2).toUtc(),
        sleepHour: 7.8,
        stressLevel: 25,
        waterintake: 2.7),
    Vitals(
        day: DateTime(2023, 5, 3).toUtc(),
        sleepHour: 7.8,
        stressLevel: 25,
        waterintake: 2.7),
    Vitals(
        day: DateTime(2023, 5, 4).toUtc(),
        sleepHour: 7.8,
        stressLevel: 25,
        waterintake: 2.7),
  ];

  void addVitalss(Vitals item) {
    Vital.add(item);
    notifyListeners();

    void increaseWater(int i) {
      Vital[i].waterintake += 0.2;
      notifyListeners();
    }
  }
}
