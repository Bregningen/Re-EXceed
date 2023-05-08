import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';

import '../Provider/Trainings.dart';

class TrainingService {
  FirebaseFirestore? _instance;
  List<Training> _trainings = [];
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Training> getTraingings() {
    return _trainings;
  }

  Future<int> getLength() async {
    FirebaseFirestore _instance = FirebaseFirestore.instance;

    CollectionReference CollectRef =
        _instance.collection(_auth.currentUser!.uid.toString());

    DocumentSnapshot snapshot = await CollectRef.doc('Training').get();
    var data;
    if (snapshot.exists) {
      data = snapshot.data() as Map;
    }
    return data.keys.length;
  }

  Future<void> getDatafromFirebase() async {
    FirebaseFirestore _instance = FirebaseFirestore.instance;

    CollectionReference collectRef =
        _instance.collection(_auth.currentUser!.uid.toString());

    DocumentSnapshot snapshot = await collectRef.doc('Training').get();
    if (snapshot.exists) {
      var data = snapshot.data() as Map;
      var trainingsData;
      for (int i = 0; i < data.keys.length; i++) {
        trainingsData = data[data.keys.elementAt(i)] as List<dynamic>;
        trainingsData.forEach((trainData) {
          _trainings.add(Training.fromJson(trainData));
        });
      }
    }
  }
}
