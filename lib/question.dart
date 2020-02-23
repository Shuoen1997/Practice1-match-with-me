import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Question extends StatelessWidget {
  final int questionIndex;
  static const questionAnswerSet = [
    {
      "question": "What is your favourite animal?",
      "icon": Icon(Icons.bubble_chart),
      "color": Colors.blueGrey,
      "answer": [
        {"option": "SeaFlapFlap", "score": 10},
        {"option": "Spider", "score": -10},
        {"option": "Cow", "score": 5}
      ]
    },
    {
      "question": "What is your favourite food?",
      "icon": Icon(Icons.fastfood),
      "color": Colors.orange,
      "answer": [
        {"option": "Eggplant", "score": -10},
        {"option": "Potato", "score": 10},
        {"option": "Dumplings", "score": 5}
      ]
    },
    {
      "question": "Who is your favourite person?",
      "icon": Icon(Icons.sentiment_satisfied),
      "color": Colors.blue,
      "answer": [
        {"option": "Yourself", "score": 5},
        {"option": "SueAnne", "score": 10},
        {"option": "Korean Fish", "score": -10}
      ]
    },
    {
      "question": "What is your favourite sport?",
      "icon": Icon(MdiIcons.walk),
      "color": Colors.green,
      "answer": [
        {"option": "PingPong", "score": 5},
        {"option": "Basketball", "score": 10},
        {"option": "I dun exercise", "score": -10}
      ]
    },
    {
      "question": "What is your favourite pastime?",
      "icon": Icon(MdiIcons.spa),
      "color": Colors.purple,
      "answer": [
        {"option": "YouTubing", "score": 5},
        {"option": "Gaming", "score": 10},
        {"option": "Clubbing", "score": -10}
      ]
    },
  ];

  Question(this.questionIndex);

  @override
  Widget build(BuildContext context) {
    Column generateQuestion(int index) {
      var currentQ = questionAnswerSet[index]['question'];
      var currentIcon = questionAnswerSet[index]['icon'] as Icon;
      var questionHeader = index + 1;
      var questionText = Text("Q$questionHeader:  \n\n$currentQ",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white));
      var questionContainer = Column(
        children: <Widget>[currentIcon, SizedBox(height: 20), questionText],
      );
      return questionContainer;
    }

    return Center(child: generateQuestion(questionIndex));
  }
}
