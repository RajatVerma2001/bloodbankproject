import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";

const Color secColor = Color.fromARGB(255, 234, 62, 62);
const Color priColor = Color(0xFFF46A6A);

class PageSubtitle extends StatelessWidget {
  const PageSubtitle({
    Key? key,
    required this.subtitle,
  }) : super(key: key);

  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    );
  }
}

class PageTitle extends StatelessWidget {
  PageTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
