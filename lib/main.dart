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
      primarySwatch: Colors.lightGreen);
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
  // The @override keywoard is not required, but it's a good practice
  @override
  Widget build(BuildContext context) {
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
            // Wrap the app in a GestureDetector so the keyboard will hide
            // when we tap on anywhere on the screen other than the keyboard area 
            body: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(child: UserTransactions()),
            )));
            
  }
}
