import 'package:flutter/material.dart';
import 'myApp.dart';
class Question extends StatelessWidget {
  final questionText;
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 150),
        child: Column(
          children: [
            Text(
              questionText,
              style: TextStyle(fontSize: 25, color: b),
            ),

          ],
        ),
      ),
    );
  }
}
