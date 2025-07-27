import 'package:flutter/material.dart';

class InvestmentQuizResultScreen extends StatelessWidget{
  const InvestmentQuizResultScreen({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz results"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: Text("Results passed"),
        )
      ),
    );
  }
}