import 'package:flutter/material.dart';
// import 'package:frontend/screens/home/basePage.dart';
import 'package:frontend/screens/quiz/investment/question_one.dart';
// import 'package:frontend/screens/quiz/investment/results.dart';

// import 'package:frontend/screens/individualLessons/tradingBasics.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: InvestMentQuizQuestionOne()
    );
  }
}