import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'chart_bar.dart';

class MyChart extends StatelessWidget {
  final List<Transaction> transactions;

  MyChart({this.transactions});

  Map<String, double> _generateChartBasedOnTransaction() {
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
    var chartMap = _generateChartBasedOnTransaction();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ...Category.values.map((ct) {
          var spentAmountForCategory = chartMap[Transaction.typeToString(ct)];
          bool exceedLimit = spentAmountForCategory > 1000;
          return Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                '\$' + spentAmountForCategory.toString(),
                style: TextStyle(
                    fontWeight:
                        exceedLimit ? FontWeight.bold : FontWeight.normal,
                    color:
                        exceedLimit ? Colors.red : Transaction.typeToColor(ct)),
              ),
              SizedBox(
                height: 20,
              ),
              ChartBar(
                color: Transaction.typeToColor(ct),
                spendingAmount: spentAmountForCategory,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Transaction.typeToIcon(ct, 36),
              )
            ],
          );
        }).toList()
      ],
    );
  }
}
