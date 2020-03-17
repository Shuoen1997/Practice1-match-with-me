import 'package:flutter/material.dart';
import 'package:practice1/widgets/input_transaction.dart';
import 'package:practice1/widgets/list_transactions.dart';
import '../models/transaction.dart';
import 'chart.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  static const AssetImage babyMilo = AssetImage('assets/images/babyMilo.png');
  final List<Transaction> _transactions = [];

  List<Transaction> get _recentTransactions{
    // This is a very useful syntax where
    // Extract a list from a list based on bool condition 
    return _transactions.where((tx){
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransactions(String titleTx, double amountTx, Category typeTx) {
    final tx = Transaction(
        id: DateTime.now().toString(),
        title: titleTx,
        amount: amountTx,
        date: DateTime.now(),
        type: typeTx);

    setState(() {
      _transactions.insert(0, tx);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MyChart(transactions: _recentTransactions,),
        InputTransaction(addTx: _addTransactions),
        _transactions.length == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(top: 150),
                      child: Opacity(
                        opacity: 0.5,
                        child: Image(
                            image: babyMilo,
                            fit: BoxFit.fill),
                      )),
                  Text(
                    'No transactions...ZZZzzz',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              )
            : ListTransactions(
                transactions: _transactions,
              )
      ],
    );
  }
}
