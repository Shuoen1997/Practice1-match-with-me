import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int endScore;
  final Function retryHandler;

  Result(this.endScore, this.retryHandler);

  Map<String, dynamic> get _matchResult {
    var emoticon;
    var color;
    var matchResultText;
    if (endScore > 44) {
      emoticon = Icons.sentiment_very_satisfied;
      color = Colors.lime[300];
      matchResultText = "We are meant to be---Soulmate!";
    } else if (endScore >= 30) {
      emoticon = Icons.sentiment_satisfied;
      color = Colors.pink[300];
      matchResultText = "We can definitely be friends :)";
    } else if (endScore >= 10) {
      emoticon = Icons.sentiment_neutral;
      color = Colors.white;
      matchResultText = "We might become friends, just maybe!";
    } else if (endScore >= -10) {
      emoticon = Icons.sentiment_dissatisfied;
      color = Colors.brown[400];
      matchResultText = "Hmmmm...I\'m not sure if we should even talk.";
    } else {
      emoticon = Icons.sentiment_very_dissatisfied;
      color = Colors.grey;
      matchResultText = "Let\'s be strangers and not hurt each other :(";
    }
    return {
      "text": matchResultText,
      "icon": Icon(
        emoticon,
        size: 120,
        color: color,
      )
    };
  }

  Text textWithStyle(String content, double mFontSize) {
    return Text(content,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: mFontSize),
        textAlign: TextAlign.center);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(child: textWithStyle("Our final matching score is...", 25)),
        SizedBox(
          height: 10,
        ),
        Container(child: textWithStyle("$endScore", 60)),
        Container(child: _matchResult['icon']),
        SizedBox(height: 10),
        Container(
          child: textWithStyle(_matchResult['text'], 30),
          margin: EdgeInsets.all(10),
        ),
        FlatButton(
            child: Icon(
              Icons.reply,
              color: Colors.green,
              size: 60,
            ),
            onPressed: retryHandler),
        Container(child: textWithStyle("Retry?", 20))
      ],
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
    );
  }
}
