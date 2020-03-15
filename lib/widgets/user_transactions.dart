import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:practice1/widgets/input_transaction.dart';
import 'package:practice1/widgets/list_transactions.dart';
import '../models/transaction.dart';


class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _transactions = [];

  void _addTransactions(String titleTx, double amountTx, Category typeTx) {
    final tx = Transaction(
        id: DateTime.now().toString(),
        title: titleTx,
        amount: amountTx,
        date: DateTime.now(),
        type: typeTx);

    setState(() {
      _transactions.add(tx);
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      InputTransaction( addTx: _addTransactions),
      ListTransactions(transactions: _transactions,) 
    ],);
  }
}
