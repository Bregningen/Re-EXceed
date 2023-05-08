// ignore_for_file: non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexceed/Cards/EvaluateQuestions/EvaluateSlider.dart';
import 'package:rexceed/Cards/EvaluateQuestions/TypeofTraining.dart';
import 'package:rexceed/Cards/appbar.dart';
import 'package:rexceed/Helpers/appColors.dart';
import 'package:rexceed/Provider/Trainings.dart';
import 'package:rexceed/main.dart';

import '../Provider/Other.dart';

class Evaluate extends StatefulWidget {
  DateTime day;
  Evaluate({required this.day});
  @override
  State<Evaluate> createState() => _EvaluateState();
}

int ConIndex = 0;
int Desireindex = 0;
int Overall = 0;
int numbertype = 0;
String NameOftheTraining = '';

class _EvaluateState extends State<Evaluate> {
  void Skub() {
    Navigator.pop(context);
  }

  List<String> qust = [
    'Hvordan har din træning overordnet været?',
    'Hvordan var koncentrationen til træningen?',
    'Hvordan var træningslysten?'
  ];

  String fortrainer = '';
  String noten = '';
  String valueText = '';

  final Note = TextEditingController();
  final ToTrainer = TextEditingController();
  final _textFieldController = TextEditingController();

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Tilføj din trænings type'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
            ),
            actions: <Widget>[
              MaterialButton(
                onPressed: () {
                  _textFieldController.clear();
                },
                textColor: AppColors.textColor,
                color: AppColors.clarit,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.14,
                  child: Row(
                    children: const [Text('Rediger'), Icon(Icons.edit)],
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  _textFieldController.clear();
                  Navigator.pop(context);
                },
                textColor: AppColors.textColor,
                color: AppColors.clarit,
                child: const Text('Anullér'),
              ),
              MaterialButton(
                color: AppColors.Main_color,
                textColor: AppColors.textColor,
                child: const Text('Tilføj'),
                onPressed: () {
                  setState(() {
                    Provider.of<OtherProvider>(context, listen: false)
                        .OtherItems
                        .TypeofTraining
                        .add(valueText);
                    valueText = '';
                    _textFieldController.clear();

                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    List<String> DropwodnItems = [];
    for (int i = 0;
        Provider.of<OtherProvider>(context, listen: false)
                .OtherItems
                .TypeofTraining
                .length >
            i;
        i++) {
      DropwodnItems.add(Provider.of<OtherProvider>(context, listen: false)
          .OtherItems
          .TypeofTraining[i]);
    }

    String dropdownvalue = Provider.of<OtherProvider>(context, listen: false)
        .OtherItems
        .TypeofTraining[0]
        .toString();
    List<String> TypeOfT = Provider.of<OtherProvider>(context, listen: false)
        .OtherItems
        .TypeofTraining;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.sort,
        appBar: MainAppBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: AutoSizeText(
                        'Evaluer din træning (${widget.day.day}/${widget.day.month})',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: AppColors.Main_color),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  EVSliderQ(question: qust[0], number: 0, viewside: false),
                  EVSliderQ(question: qust[1], number: 1, viewside: false),
                  EVSliderQ(question: qust[2], number: 2, viewside: false),
                  Row(
                    children: [
                      TypeOfTraining(
                        dropdownvalue: dropdownvalue,
                        DropwodnItems: DropwodnItems,
                      ),
                      IconButton(
                          onPressed: () {
                            _displayTextInputDialog(context);
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: AppColors.Main_color,
                          ))
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: AppColors.white),
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                      child: AutoSizeText(
                        'Skriv eventuelt en kort note til træningen. \nHar du fået feedback eller er der noget som gik særligt godt?',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 50),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextField(
                        controller: Note,
                        onChanged: (value) => noten = value,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.Main_color)),
                            fillColor: Colors.white),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: AppColors.white),
                    width: MediaQuery.of(context).size.width * 0.95,
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                      child: AutoSizeText(
                        'Fortæl din træner hvorfor eller hvorfor ikke det har været en god træning',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 50),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextField(
                        controller: ToTrainer,
                        onChanged: (value) => noten = value,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.Main_color)),
                            fillColor: Colors.white),
                      )),
                  TextButton(
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            color: AppColors.Main_color,
                            borderRadius: BorderRadius.circular(28)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Gem træning',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                    onPressed: () async {
                      uploading(context);
                      updateData();
                      await _UploadCloud2();
                      Skub();
                      Skub();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> uploading(BuildContext context) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
  }

  void updateData() {
    Provider.of<TrainingEvalueted>(context, listen: false).trainings.add(
        Training(
            TypeOfTraining: NameOftheTraining,
            Note: noten,
            ToTrainer: fortrainer,
            Concentration: ConIndex,
            Desire: Desireindex,
            Overall: Overall,
            day: widget.day));
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> _UploadCloud2() async {
    await FirebaseFirestore.instance
        .collection(_auth.currentUser!.uid.toString())
        .doc('Training')
        .update({
      widget.day.toIso8601String().split('.')[0]: [
        {
          'TypeOfTraining': NameOftheTraining,
          'Concentration': ConIndex,
          'Desire': Desireindex,
          'Overall': Overall,
          'day': widget.day,
          'Note': noten,
          'ToTrainer': fortrainer,
        }
      ]
    });
  }
}
