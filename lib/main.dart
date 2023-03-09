import 'package:flutter/material.dart';
import 'SpalshScreen.dart';
import 'myApp.dart';
class TheQuizApp extends StatelessWidget {
  const TheQuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MySpalshScreen(),
    );
  }
}

void main() {
  runApp(const TheQuizApp());
}

