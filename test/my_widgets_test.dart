import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/widgets/input_transaction.dart';
import '../lib/widgets/user_transactions.dart';
import '../lib/widgets/chart_bar.dart';
import '../lib/widgets/chart.dart';
import '../lib/models/transaction.dart';

import 'package:practice1/constant.dart' as constant;

void main() {
  testWidgets('TEST 1: Add transaction to app', (WidgetTester tester) async {
    // We initialize our widget wrapped with Material App
    // Else, it will throw error
    // Thank you this article
    // https://medium.com/@castellano.mariano/test-widget-in-flutter-5894b238ff30
    var widgetToBeTested = MaterialApp(home: UserTransactions());

    // Now we pump the widget!
    await tester.pumpWidget(widgetToBeTested);

    // And we should expect to see the no transaction txt
    expect(find.text(constant.DEFAULT_NO_TRANSACTION_TXT), findsOneWidget);

    // // And we should expect to see the Baby Milo image rendered
    expect(find.byKey(Key('babyMiloImage')), findsOneWidget);

    // // We click on Add Transactions button
    await tester.tap(find.byKey(Key('addTransactionButton')));
    await tester.pumpAndSettle();

    // // And we sould expect to see the Transaction title textfield 
    // expect(find.byKey(Key('title')), findsOneWidget);

    // // And we should expect to see the Transaction amount textfield
    // expect(find.byKey(Key('amount')), findsOneWidget);

    // // And we should expect to see the Category dropdown 
    // expect(find.byKey(Key('category')), findsOneWidget);

    // // We enter transaction title 
    // await tester.enterText(find.byKey(Key('title')), 'Transaction title');

    // // We enter transaction amount 
    // await tester.enterText(find.byKey(Key('amount')), '100');

    // We click on the Date Picker button
    // await tester.tap(find.byKey(Key('datePickerButton'))); 
    // await tester.pumpAndSettle();
    
    // // And we should expect to see the Cupertino DatePicker  
    // expect(find.byType(CupertinoDatePicker), findsOneWidget);

    // // We click on the Confirm button
    // await tester.tap(find.byKey(Key('confirmDatePickerButton')));
    // await tester.pumpAndSettle();

    // // Then we should not see the DatePicker  
    // expect(find.byType(CupertinoDatePicker), findsNothing);

    // // We click on Add Transactions button
    // await tester.tap(find.byKey(Key('addTransactionButton')));
    // await tester.pumpAndSettle();

    // And we should see the first Transaction item
    // expect(find.byType(ListTile), findsOneWidget);



    // // Swipe the item to dismiss it.
    // await tester.drag(find.byType(Dismissible), Offset(500.0, 0.0));

    // // Build the widget until the dismiss animation ends.
    // await tester.pumpAndSettle();

    // // Ensure that the item is no longer on screen.
    // expect(find.text('hi'), findsNothing);
  });
}
