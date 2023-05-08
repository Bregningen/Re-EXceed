import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexceed/Helpers/appColors.dart';
import 'package:rexceed/Provider/Other.dart';
import 'package:rexceed/Provider/Parameter.dart';
import 'package:rexceed/Provider/Trainings.dart';
import 'package:rexceed/Services/GetTheTrainingData.dart';
import 'package:rexceed/sider/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rexceed/Services/loadingFiles.dart';
import 'package:rexceed/sider/sign-in.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'Helpers/authpage.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  initializeDateFormatting().then((_) => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => VitalParameters(),
          ),
          ChangeNotifierProvider(
            create: (_) => TrainingEvalueted(),
          ),
          ChangeNotifierProvider(
            create: (_) => OtherProvider(),
          ),
          Provider(create: (_) => TrainingService())
        ],
        child: MaterialApp(
            theme:
                ThemeData(primarySwatch: Colors.green, fontFamily: 'BebasNeue'),
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (BuildContext context) => SafeArea(
                    child: Scaffold(
                      backgroundColor: AppColors.sort,
                      body: StreamBuilder<User?>(
                        stream: FirebaseAuth.instance.authStateChanges(),
                        builder: ((context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return const Center(
                              child: Text('Noget gik galt'),
                            );
                          } else if (snapshot.hasData) {
                            return SplashPage(
                              gotopage: '/Home',
                            );
                          } else {
                            return const AuthPage();
                          }
                        }),
                      ),
                    ),
                  ),
              '/Home': (context) => Home(),
            }),
      )));
}
