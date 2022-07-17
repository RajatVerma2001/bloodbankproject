import 'package:bloodbankproject/screens/homeScreen.dart';
import "package:flutter/material.dart";
import "loginScreen.dart";
import "package:firebase_auth/firebase_auth.dart";

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser == null) {
      return LoginScreen();
    } else {
      return HomeScreen();
    }
  }
}
