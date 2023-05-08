import 'package:flutter/material.dart';
import 'package:rexceed/Cards/appbar.dart';
import 'package:rexceed/Helpers/appColors.dart';
import 'package:rexceed/sider/PreFeature.dart';

class Exercise extends StatefulWidget {
  const Exercise({Key? key}) : super(key: key);

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: MainAppBar(),
            backgroundColor: AppColors.sort,
            body: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: AppColors.Main_color,
                          borderRadius: BorderRadius.circular(25)),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Premiumfeture()));
                        },
                        title: const Center(
                          child: Text(
                            'Full body work out',
                            style:
                                TextStyle(fontSize: 45, color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: AppColors.Main_color,
                              borderRadius: BorderRadius.circular(25)),
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Premiumfeture()));
                              },
                              child: const Center(
                                  child: Text(
                                'Never skip Leg day',
                                style: TextStyle(
                                    fontSize: 35, color: AppColors.white),
                                textAlign: TextAlign.center,
                              ))),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: AppColors.Main_color),
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Premiumfeture()));
                                },
                                child: const Center(
                                    child: Text(
                                  'For the upper body',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 35, color: AppColors.white),
                                ))),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: AppColors.Main_color,
                          borderRadius: BorderRadius.circular(25)),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Premiumfeture()));
                        },
                        title: Center(
                          child: Text(
                            'Only bodyweight',
                            style:
                                TextStyle(fontSize: 45, color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
