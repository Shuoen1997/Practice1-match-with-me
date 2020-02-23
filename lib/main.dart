import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practice1/quiz.dart';
import 'package:practice1/result.dart';
import './question.dart';

/// This is a shorter way for saying this:
/// // void main(){
//   var app = MyCoolApp();
//   runApp(app);
// }
/// When the function only contains one line of code,
/// This is a cleaner approach
/// fcba03
void main() => runApp(MyCoolApp());

ThemeData myAppTheme() {
  return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.purple,
      accentColor: Colors.yellow[700]);
}

class MyCoolApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyCoolAppState();
  }
}

/// Every widgets in Flutter would need to
/// extends either the StatelessWidget or StatefulWidget
class _MyCoolAppState extends State<MyCoolApp> {
  var _currentQuestionIndex = 0;
  var _endOfQuiz = false;
  var _currentScore = 0;

  void _updateIndex(int score) {
    setState(() {
      _currentQuestionIndex += 1;
      _currentScore += score;
    });
    // print(_currentQuestionIndex);
    print(_currentScore);
  }

  void _retryQuiz(){
    setState(() {
      _currentQuestionIndex = 0;
      _currentScore = 0;
      _endOfQuiz = false;
    });
    print("Quiz is restarted!");
  }

  // The @override keywoard is not required, but it's a good practice
  @override
  Widget build(BuildContext context) {

    if (_currentQuestionIndex > Question.questionAnswerSet.length - 1) {
      _endOfQuiz = true;
    }

    return MaterialApp(
        title: 'MyFirstApp',
        theme: myAppTheme(),
        home: Scaffold(
          appBar: AppBar(title: Text("MATCH WITH ME", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
          body: _endOfQuiz
              ? Result(_currentScore, _retryQuiz)
              : Quiz(_currentQuestionIndex, _updateIndex),
        ));
  }
}
