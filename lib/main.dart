import 'package:flutter/material.dart';
//import 'package:quizapp1/screens/NewPage.dart';
import 'package:quizapp1/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quiz Game",
      debugShowCheckedModeBanner: false,
      home: Screen(),
      //home: NewPage(),
    );
  }
}
