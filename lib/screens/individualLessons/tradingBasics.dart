import 'package:flutter/material.dart';

class TradingBasicsScreen extends StatelessWidget{
  const TradingBasicsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Trading basics"),)
        ],
      ),
    );
  }
}