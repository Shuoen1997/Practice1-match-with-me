import 'package:flutter/material.dart';

class MyTextStyle extends StatelessWidget {

  final String txt;

  MyTextStyle(this.txt);
  
  @override
  Widget build(BuildContext context) {
    return Text(txt, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black));
  }
}