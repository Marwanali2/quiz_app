import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';

import 'answer.dart';
class Quiz extends StatelessWidget {
  final Questions;
  final QuestionIndex;
  final mysize;
  final Function (int s) answerQuestionSelected;
   Quiz(this.Questions,this.QuestionIndex,this.mysize,this.answerQuestionSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Question(
              Questions[QuestionIndex]['questionText']),
          mysize,
          ...(Questions[QuestionIndex]['answers']as List<Map<String,Object>>)
              .map((answer) {
            return Column(
              children: [
                Answer(answer['text'].toString(),()=>answerQuestionSelected(int.parse(answer['score'].toString())),answer['score'].toString()),
                mysize,
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}