import 'package:flutter/material.dart';

import "package:firebase_core/firebase_core.dart";
import 'package:bloodbankproject/screens/firstScreen.dart';
import 'services/routing.dart';
//import 'dart:math';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: firstScreenID,
      onGenerateRoute: routing,
    );
  }
}
