// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:currencyconverter/main.dart';

void main() {
  testWidgets('Currency Converter UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: CurrencyConverter(),
    ));

    // Expect to find initial widgets in the Currency Converter screen.
    expect(find.text('Convert 1.00 USD to EUR'), findsOneWidget);
    expect(find.text('Enter Amount'), findsOneWidget);
    expect(find.text('USD'), findsOneWidget);
    expect(find.text('EUR'), findsOneWidget);
    expect(find.text('Convert'), findsOneWidget);
    expect(find.text('Result: 0.00 EUR'), findsOneWidget);

    // Now, let's simulate entering an amount and converting
    await tester.enterText(find.byType(TextField), '10.0'); // Enter amount 10.0
    await tester.tap(find.text('Convert')); // Tap on Convert button
    await tester.pump(); // Rebuild the widget after the state has changed

    // Expect the result to be updated after conversion
    expect(find.text('Result:'), findsOneWidget);
    expect(find.text('10.00 EUR'), findsOneWidget);
  });
}
