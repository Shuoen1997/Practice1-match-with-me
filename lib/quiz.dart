import './question.dart';
import './answer.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  final int currentQuestionIndex;
  final Function selectHandler;

  Quiz(this.currentQuestionIndex, this.selectHandler);

  @override
  Widget build(BuildContext context) {
    var answerSet = Question.questionAnswerSet[currentQuestionIndex]['answer']
        as List<Map<String, dynamic>>;
    var color = Question.questionAnswerSet[currentQuestionIndex]['color'] as Color;
    var icon = Question.questionAnswerSet[currentQuestionIndex]['icon'] as Icon;


    return Column(
      children: <Widget>[
        Question(currentQuestionIndex),
        SizedBox(height: 60,),
        ...answerSet.map((option){
          return Column(children: <Widget>[Answer(color, icon, selectHandler, option ),SizedBox(height: 30,)]);
        }).toList(),
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
}
