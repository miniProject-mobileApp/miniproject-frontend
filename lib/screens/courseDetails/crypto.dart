import 'package:flutter/material.dart';

class CryptoScreen extends StatelessWidget{
  const CryptoScreen({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Introduction to crypto currency"),
        titleTextStyle: TextStyle(),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.blue, ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Intro to Crypto"),)
        ],
      ),
    );
  }
}