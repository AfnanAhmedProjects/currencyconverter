import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home.dart';
import 'about.dart';
import 'contact.dart';
import 'predictions.dart';

void main() {
  runApp(MaterialApp(
    title: 'Currency Converter',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.teal,
        primary: Colors.teal,
        secondary: Colors.orange,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
        headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.teal[900]),
        bodyMedium: TextStyle(fontSize: 16.0, color: Colors.teal[700]),
        labelLarge: TextStyle(fontSize: 18.0, color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        prefixIconColor: Colors.teal,
        labelStyle: TextStyle(color: Colors.teal),
      ),
    ),
    initialRoute: '/home',
    routes: {
      // '/': (context) => CurrencyConverter(),
      '/home': (context) => HomePage(),
      '/about': (context) => AboutPage(),
      '/contact': (context) => ContactPage(),
      '/predictions': (context) => PredictionsPage(),
    },
  ));
}

// The CurrencyConverter class remains the same.
