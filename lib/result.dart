import 'package:flutter/material.dart';
import 'myApp.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Result extends StatelessWidget {
  final VoidCallback restartQuiz;
  final int totalScore;

  const Result(this.restartQuiz, this.totalScore, {super.key});

  String get finalResult {
    String myResult;
    if (totalScore >= 3) {
      myResult = 'Excellent';
    } else if (totalScore == 2) {
      myResult = 'Very Good';
    } else {
      myResult = 'Good';
    }
    return myResult;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 200),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  finalResult,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: b,
                    fontSize: 45,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.done,
                  color: Colors.green,
                  size: 50,
                )
              ],
            ),
            SizedBox(height: 50,),
            Text(
              'Your result is $totalScore',
              style: TextStyle(
                fontSize: 45,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: b,
              ),
            ),
            SizedBox(height: 270),

            ElevatedButton(
              onPressed: restartQuiz,
              child: Text(
                'Restart The Quiz',
                style: TextStyle(fontSize: 25, color: b),
              ),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)))
              ),
            )
          ],
        ),
      ),
    );
  }
}