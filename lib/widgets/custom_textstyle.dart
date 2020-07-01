import 'package:flutter/material.dart';

class MyTextStyle extends StatelessWidget {

  final String txt;

  const MyTextStyle(this.txt);
  
  @override
  Widget build(BuildContext context) {
    return Text(txt, style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).primaryColorDark));
  }
}
