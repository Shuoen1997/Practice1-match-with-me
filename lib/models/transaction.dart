import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Category { Entertainment, Food, Clothes, Transportation, Other }

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category type;

  static const double maxSpending = 100; 

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date,
      @required this.type});
  
  String get stringOfType {
    return typeToString(this.type);
  }

  Icon get iconOfType {
    return typeToIcon(this.type, 36);
  }

  Color get colorOfType {
    return typeToColor(this.type);
  }

  static String typeToString(Category type){

    return type.toString().split('.').last;

  }

  static Icon typeToIcon(Category type, double sizeOfIcon) {
    Icon icon;
    switch (type) {
      case Category.Clothes:
        icon = Icon(
          Icons.loyalty,
          size: sizeOfIcon,
        );
        break;
      case Category.Entertainment:
        icon = Icon(Icons.local_play, size: sizeOfIcon);
        break;
      case Category.Food:
        icon = Icon(Icons.restaurant, size: sizeOfIcon);
        break;
      case Category.Transportation:
        icon = Icon(Icons.local_gas_station, size: sizeOfIcon);
        break;
      case Category.Other:
        icon = Icon(Icons.bubble_chart, size: sizeOfIcon);
        break;
    }
    return icon;
  }

  static Color typeToColor(Category type) {
    Color color;
    switch (type) {
      case Category.Clothes:
        color = Colors.lightBlue[300];
        break;
      case Category.Entertainment:
        color = Colors.teal[300];
        break;
      case Category.Food:
        color = Colors.deepPurple[300];
        break;
      case Category.Transportation:
        color = Colors.orange[300];
        break;
      case Category.Other:
        color = Colors.indigo[300];
        break;
    }
    return color;
  }
}
