import 'package:flutter/material.dart';
import 'myApp.dart';
class Answer extends StatelessWidget {
  final String answerText;
  final String ansScore;
  final VoidCallback onPressed_answerText;
  Answer(this.answerText, this.onPressed_answerText,this.ansScore, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300,
          height: 65,
          child: Card(
            color: Colors.purple,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child:
            ListTile(
              title: Text( answerText, style: TextStyle(fontSize: 20, color: b),),
              trailing: Text("Score : $ansScore",style: TextStyle(color: b),),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              onTap: onPressed_answerText,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
