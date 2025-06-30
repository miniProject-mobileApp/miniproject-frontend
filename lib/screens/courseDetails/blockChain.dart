import 'package:flutter/material.dart';

class BlockchainScreen extends StatelessWidget{
  const BlockchainScreen({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Intro to block chain"),)
        ],
      ),
    );
  }
}