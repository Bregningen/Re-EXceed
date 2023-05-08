import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Training {
  DateTime day;
  int Overall;
  int Concentration;
  int Desire;
  String Note;
  String ToTrainer;
  String TypeOfTraining;
  Training({
    required this.TypeOfTraining,
    required this.Concentration,
    required this.Desire,
    required this.Overall,
    required this.day,
    required this.Note,
    required this.ToTrainer,
  });

  factory Training.fromJson(Map<String, dynamic> json) {
    return Training(
        TypeOfTraining: json['TypeOfTraining'],
        Concentration: json['Concentration'],
        Desire: json['Desire'],
        Overall: json['Overall'],
        day: (json['day'] as Timestamp).toDate().toUtc(),
        Note: json['Note'],
        ToTrainer: json['ToTrainer']);
  }
}

class TrainingEvalueted with ChangeNotifier {
  List<Training> trainings = [];
}
