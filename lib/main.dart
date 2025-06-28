import 'package:flutter/material.dart';
import 'package:frontend/screens/basePage.dart';
import 'package:frontend/screens/oldSignUpPage.dart';
import 'package:frontend/screens/onboardingScreen.dart';
import 'package:frontend/screens/signUpPage.dart';
// import 'package:frontend/screens/homePage.dart';
// import 'package:frontend/screens/lessonPage.dart';
// import 'package:frontend/screens/onboardingScreen.dart';

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
      home: SignUpScreen()
    );
  }
}