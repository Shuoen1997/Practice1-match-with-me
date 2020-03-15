import 'package:flutter/material.dart';
import './input_transaction.dart';
import '../models/transaction.dart';
import './user_transactions.dart';
import 'package:intl/intl.dart';

class ListTransactions extends StatelessWidget {

  final List<Transaction> transactions;

  ListTransactions({this.transactions}); 

  @override
  Widget build(BuildContext context) {

  
    return Container(
      height: 500,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              child: ListTile(
                leading: transactions[index].iconOfType,
                title: Text(
                  transactions[index].title.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '\$${transactions[index].amount}',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                trailing:
                    Text(DateFormat.yMd().format(transactions[index].date)),
              ),
            ),
            elevation: 15,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                side: BorderSide(color: transactions[index].colorOfType)),
            margin: EdgeInsets.all(10),
          );
        },
      ),
    );
  }
}