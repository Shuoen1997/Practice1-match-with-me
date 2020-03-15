import 'dart:ui';

import 'package:flutter/material.dart';
import 'widgets/user_transactions.dart';

/// This is a shorter way for saying this:
/// // void main(){
//   var app = MyCoolApp();
//   runApp(app);
// }
/// When the function only contains one line of code,
/// This is a cleaner approach
void main() => runApp(MyCoolApp());

ThemeData myAppTheme() {
  return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.cyanAccent[100],
      accentColor: Colors.yellow[700]);
}

class MyCoolApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyCoolAppState();
  }
}

/// Every widgets in Flutter would need to
/// extends either the StatelessWidget or StatefulWidget
class _MyCoolAppState extends State<MyCoolApp> {
  // List<Transaction> _transactionGenerator(int numOfTransactions) {
  //   List<Transaction> tempList = [];
  //   for (var i = 0; i < numOfTransactions; ++i) {
  //     final transaction = Transaction(
  //         id: 't$i',
  //         title: "This is the title",
  //         amount: 20.00,
  //         date: DateTime.now(),
  //         type: Category.Clothes);
  //     tempList.add(transaction);
  //   }
  //   return tempList;
  // }

  // List<Transaction> _hardCodedTransactions = [
  //   Transaction(
  //       id: 't1',
  //       title: "Baby Milo shirt",
  //       amount: 120.00,
  //       date: DateTime.now(),
  //       type: Category.Clothes),
  //   Transaction(
  //       id: 't2',
  //       title: "Orange juice",
  //       amount: 5.00,
  //       date: DateTime.now(),
  //       type: Category.Food),
  //   Transaction(
  //       id: 't3',
  //       title: "Adele Concert",
  //       amount: 220.00,
  //       date: DateTime.now(),
  //       type: Category.Entertainment),
  //   Transaction(
  //       id: 't4',
  //       title: "Uber to home",
  //       amount: 20.00,
  //       date: DateTime.now(),
  //       type: Category.Transportation),
  //   Transaction(
  //       id: 't5',
  //       title: "Red envelops",
  //       amount: 500.00,
  //       date: DateTime.now(),
  //       type: Category.Other),
  //   Transaction(
  //       id: 't6',
  //       title: "Car wash",
  //       amount: 3.00,
  //       date: DateTime.now(),
  //       type: Category.Transportation)
  // ];

  // The @override keywoard is not required, but it's a good practice
  @override
  Widget build(BuildContext context) {
    // var transactions = _hardCodedTransactions;

    return MaterialApp(
        title: 'MySecondApp',
        theme: myAppTheme(),
        home: Scaffold(
            appBar: AppBar(
                title: Text(
              "MY BUDGET APP",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            )),
            body: SingleChildScrollView( child:
                UserTransactions()
            )));
  }
}
