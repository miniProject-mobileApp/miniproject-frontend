import 'package:flutter/material.dart';
import 'package:frontend/pages/introductoryPages/page_one.dart';
import 'package:frontend/pages/introductoryPages/page_three.dart';
import 'package:frontend/pages/introductoryPages/page_two.dart';
import 'package:frontend/screens/onboardingScreen.dart';
// import 'package:frontend/pages/introductoryPages/page_one.dart';

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
      home: OnboardingScreen()
    );
  }
}