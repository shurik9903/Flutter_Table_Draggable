import 'package:flutter/material.dart';
import 'package:flutter_table/Pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Table App',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        textTheme: TextTheme(
          caption: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
