import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Category { Entertainment, Food, Clothes, Transportation, Other }

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category type;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date,
      @required this.type});

  Icon get iconOfType {
    return typeToIcon(type, 36);
  }

  Color get colorOfType {
    return typeToColor(this.type);
  }

  static Icon typeToIcon(Category type, double sizeOfIcon){
    Icon icon;
    switch (type) {
      case Category.Clothes:
        icon = Icon(
          Icons.add_shopping_cart,
          size: sizeOfIcon,
        );
        break;
      case Category.Entertainment:
        icon = Icon(Icons.music_note, size: sizeOfIcon);
        break;
      case Category.Food:
        icon = Icon(Icons.fastfood, size: sizeOfIcon);
        break;
      case Category.Transportation:
        icon = Icon(Icons.subway, size: sizeOfIcon);
        break;
      case Category.Other:
        icon = Icon(Icons.wifi_tethering, size: sizeOfIcon);
        break;
    }
    return icon;
  }

  static Color typeToColor(Category type) {
    Color color;
    switch (type) {
      case Category.Clothes:
        color = Colors.pink[300];
        break;
      case Category.Entertainment:
        color = Colors.blue[300];
        break;
      case Category.Food:
        color = Colors.purple[300];
        break;
      case Category.Transportation:
        color = Colors.orange[300];
        break;
      case Category.Other:
        color = Colors.cyan[300];
        break;
    }
    return color;
  }
}
