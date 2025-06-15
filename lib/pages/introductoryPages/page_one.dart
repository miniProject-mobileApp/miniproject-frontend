
import 'package:flutter/material.dart';

class IntroductoryPageOne extends StatelessWidget{
  const IntroductoryPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Stack(
        children: [
          Positioned(
            left: 20,
            right: 20,
            top: MediaQuery.of(context).size.height * 0.15,
            child: Image.asset(
              'assets/images/intro_page_one.png',
              fit: BoxFit.cover,
            )
          ),


          Positioned(
            top: MediaQuery.of(context).size.height * 0.60,
            left: 16,
            right: 16,
            child: Text(
              "Learn About Finance",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[300]
              ),
              textAlign: TextAlign.center,

              ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.65,
            left: 16,
            right: 16,
            child: Container(
              width: double.infinity,
              child: Text(
                "Fintech offers simple lessons to help you better understand and manage your finances",
                style: TextStyle(
                  color: Colors.blue[300]
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          )
          
        ],
      )
      
    );
  }
}