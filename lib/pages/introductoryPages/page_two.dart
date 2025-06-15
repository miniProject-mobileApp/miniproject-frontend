import 'package:flutter/material.dart';

class IntroductoryPageTwo extends StatelessWidget{
  const IntroductoryPageTwo({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            right: 20,
            left: 20,
            child: Image.asset(
              'assets/images/intro_page_two.png',
              fit: BoxFit.contain
            )
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.60,
            left: 16,
            right: 16,
            child: Text(
              "Track your finance",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue[300],
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.65,
            left: 16,
            right: 16,
            child: Text(
              "Track the progress of your savings and start a habit of saving with Fintech",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue[300]
              ),
            ),
          )
        ],
      ),
    );
  }
}