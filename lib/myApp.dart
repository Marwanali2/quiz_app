import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyQuizHome(),
    );
  }
}

class MyQuizHome extends StatefulWidget {
  const MyQuizHome({Key? key}) : super(key: key);

  @override
  State<MyQuizHome> createState() => _MyQuizHomeState();
}

Color w = Colors.white;
Color b = Colors.black;
class _MyQuizHomeState extends State<MyQuizHome> {
  @override
  final List _Questions = [
    {
      'questionText': 'What\'s the capital of egypt ?',
      'answers': [
        {'text': 'Alex', 'score': 10},
        {'text': 'Cairo', 'score': 20},
        {'text': 'Aswan', 'score': 30},
        {'text': 'Luxor', 'score': 40}
      ]
    },
    {
      'questionText': 'What\'s the club of century ?',
      'answers': [
        {'text': 'Zamalek', 'score': 10},
        {'text': 'Bayern Munich', 'score': 20},
        {'text': 'Real Madrid', 'score': 30},
        {'text': 'Man City', 'score': 40}
      ]
    },
    {
      'questionText': 'What\'s result of 4*3  ?',
      'answers': [
        {'text': '18', 'score': 10},
        {'text': '16', 'score': 20},
        {'text': '14', 'score': 30},
        {'text': '12', 'score': 40}
      ]
    },
    {
      'questionText': 'What\'s result of 6*(5+3) ?',
      'answers': [
        {'text': '33', 'score': 10},
        {'text': '48', 'score': 20},
        {'text': '18', 'score': 30},
        {'text': '12', 'score': 40}
      ]
    },
  ];
  int _QuestionIndex = 0;
  int _totalScore = 0;
  int num0 = 0, num1 = 0, num2 = 0, num3 = 0;

  void answerQuestionSelected(int? score) {
    if (_QuestionIndex == 0)
      num0 = score!;
    else if (_QuestionIndex == 1)
      num1 = score!;
    else if (_QuestionIndex == 2)
      num2 = score!;
    else if (_QuestionIndex == 3) num3 = score!;
    _totalScore += score!;
    setState(() {
      _QuestionIndex += 1;
    });
  }

  SizedBox _mysize = SizedBox(
    height: 30,
  );

  void restartQuiz() {
    setState(() {
      _QuestionIndex = 0;
      _totalScore = 0;
      num0 = 0;
      num1 = 0;
      num2 = 0;
      num3 = 0;
    });
  }

  bool isSwitched = false;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: w,
      appBar: AppBar(
        backgroundColor: w,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Divider(
            color: Colors.purple,
            height: 2,
            thickness: 5,
          ),
        ),
        title: Center(
          child: Text(
            'Quiz App',
            style: TextStyle(color: Colors.purple, fontSize: 25),
          ),
        ),
      ),
      body: Container(
        child: _QuestionIndex < _Questions.length
            ? Quiz(_Questions, _QuestionIndex, _mysize, answerQuestionSelected)
            : Result(restartQuiz, _totalScore),
      ),
      floatingActionButton: Wrap(
        direction: Axis.horizontal,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              setState(() {
                b = b == Colors.black ? Colors.white : Colors.black;
                w = w == Colors.white ? Colors.black : Colors.white;

              });
            },
            backgroundColor: Colors.purple,
            child: Icon(b == Colors.black
                ? Icons.nightlight
                : Icons.light_mode_outlined),
          ),

          const SizedBox(width: 250,),
          FloatingActionButton(
            onPressed: () {
             if (_QuestionIndex == 1) {
                _totalScore -= num0;
              } else if (_QuestionIndex == 2) {
                _totalScore -= num1;
              } else if (_QuestionIndex == 3) {
                _totalScore -= num2;
              } else {
                _totalScore -= num3;
              }
              setState(() {
                if (_QuestionIndex > 0) {
                  _QuestionIndex--;
                }
              });
            },
            backgroundColor: Colors.purple,
            child: Icon(Icons.arrow_back, color: b),
          ),
        ],
      ),
    );
  }
}
