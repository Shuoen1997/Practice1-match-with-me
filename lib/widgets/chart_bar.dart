import 'package:flutter/material.dart';
import '../models/transaction.dart';

class ChartBar extends StatelessWidget {
  final Color color;
  final double spendingAmount;

  ChartBar({this.color, this.spendingAmount});

  double get _spendingMaxPercentage {
    final _percentage = (spendingAmount / Transaction.maxSpending);
    return _percentage > 1 ? 1 : _percentage;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 10,
      child: Stack(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  color: color)),
          FractionallySizedBox(
            heightFactor: (1 - _spendingMaxPercentage),
            child: Container(
              decoration: BoxDecoration(color: Colors.blueGrey[300]),
            ),
          )
        ],
      ),
    );
  }
}
