import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Color color;
  final Icon icon;
  final Map<String, Object> hintText;
  final Function selectHandler;

  Answer(this.color, this.icon, this.selectHandler, this.hintText);

  @override
  Widget build(BuildContext context) {
    var rb = RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      textColor: Colors.white,
      color: color,
      child: Row(
        children: <Widget>[
          icon,
          SizedBox(width: 5),
          Text(hintText['option']),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min 
      ),
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 5),
      onPressed: ()=>selectHandler(hintText['score']),
    );
    return Container(child: rb,);
  }
}
