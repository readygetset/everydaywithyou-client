import 'package:flutter/material.dart';
import 'questionList.dart';
import 'writeQuestion.dart';
import 'todayQuestion.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: writeQuestionWidget()
    );
  }
}
