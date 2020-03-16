import 'package:flutter/material.dart';
import '../models/transaction.dart';

class MyChart extends StatelessWidget {
  final List<Transaction> transactions;

  MyChart({this.transactions});

  Map<String, double> generateChartBasedOnTransaction() {
    Map<String, double> chartMap = Map.fromIterable(Category.values,
        key: (item) => Transaction.typeToString(item), value: (item) => 0.00);

    for (var transaction in transactions) {
      chartMap[transaction.stringOfType] += transaction.amount;
    }

    print(chartMap);

    return chartMap;
  }

  @override
  Widget build(BuildContext context) {
  }
}
