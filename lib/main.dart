import 'dart:ui';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'widgets/user_transactions.dart';

/// This is a shorter way for saying this:
/// // void main(){
//   var app = MyCoolApp();
//   runApp(app);
// }
/// When the function only contains one line of code,
/// This is a cleaner approach
void main() {
  // A good solution to implement when too lazy to implement
  // landscape mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyCoolApp());
}

ThemeData myMaterialAppTheme() {
  return ThemeData(brightness: Brightness.dark, primarySwatch: Colors.orange);
}

CupertinoThemeData myCupertioAppTheme() {
  return CupertinoThemeData(
      barBackgroundColor: Colors.orange, brightness: Brightness.dark, primaryColor: Colors.white);
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
  bool isIOS = Platform.isIOS;
  // The @override keywoard is not required, but it's a good practice
  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = isIOS
        ? CupertinoNavigationBar(
            backgroundColor: Colors.blueGrey,
            middle: Text(
              "MY BUDGET APP",
              style: TextStyle(color: Colors.white),
            ),
            trailing: Row(
              children: <Widget>[
                GestureDetector(
                  child: Icon(CupertinoIcons.settings),
                  onTap: () => print('Triggered'),
                )
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          )
        : AppBar(
            title: Text(
            "MY BUDGET APP",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ));
    final pageBody = GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(child: SingleChildScrollView(child: UserTransactions())),
    );
    return MaterialApp(
            title: 'MySecondApp',
            theme: myMaterialAppTheme(),
            home: Scaffold(
              body: pageBody,
              appBar: appBar,
            ));
  }
}
