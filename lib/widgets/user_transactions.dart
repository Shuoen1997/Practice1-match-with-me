import 'package:flutter/material.dart';
import 'input_transaction.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

import 'chart.dart';
import 'package:practice1/constant.dart' as constant;

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  static const AssetImage babyMilo = AssetImage('assets/images/babyMilo.png');
  final List<Transaction> _transactions = [];

  Future<void> showDeleteDialog(
      BuildContext context, int transactionIndex) async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text(constant.DELETE_TX_TITLE_TXT),
              content: Text(constant.ARE_YOU_SURE_DELETE_TXT),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text(constant.DELETE_BUTTON),
                  onPressed: () {
                    setState(() {
                      _transactions.removeAt(transactionIndex);
                      Navigator.of(context).pop();
                    });
                  },
                ),
                CupertinoDialogAction(
                  child: Text(constant.CANCEL_BUTTON),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ],
            ));
  }

  List<Transaction> get _recentTransactions {
    // This is a very useful syntax where
    // Extract a list from a list based on bool condition

    // 'Where' returns an iterable, so we have to call
    // toList() at the end to turn it into a list
    return _transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransactions(
      String titleTx, double amountTx, Category typeTx, DateTime dateTx) {
    final tx = Transaction(
        id: DateTime.now().toString(),
        title: titleTx,
        amount: amountTx,
        date: dateTx,
        type: typeTx);

    setState(() {
      _transactions.insert(0, tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MyChart(
            transactions: _recentTransactions,
          ),
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
                              key: Key('babyMiloImage'),
                              image: babyMilo,
                              fit: BoxFit.fill),
                        )),
                    Text(
                      constant.DEFAULT_NO_TRANSACTION_TXT,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Theme.of(context).primaryColorDark),
                    ),
                  ],
                )
              : Container(
                  height: MediaQuery.of(context).size.height  * 0.6,
                  child: ListView.builder(
                    itemCount: _transactions.length,
                    itemBuilder: (context, index) {
                      return Card(
                        key: Key('transaction' + index.toString()),
                        child: ListTile(
                          onLongPress: () => showDeleteDialog(context, index),
                          leading: _transactions[index].iconOfType,
                          title: Text(
                            _transactions[index].title.toString(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '\$${_transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          trailing: Text(DateFormat.yMd()
                              .format(_transactions[index].date)),
                        ),
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            side: BorderSide(
                                color: _transactions[index].colorOfType)),
                        margin: EdgeInsets.all(10),
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}
