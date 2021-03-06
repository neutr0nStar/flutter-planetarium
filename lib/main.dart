import 'package:flutter/material.dart';
import 'package:planetarium/views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planetarium',
      theme: ThemeData.dark().copyWith(accentColor: Colors.blue),
      home: HomePage(),
    );
  }
}
