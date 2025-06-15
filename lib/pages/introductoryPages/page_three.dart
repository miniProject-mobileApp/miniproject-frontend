import 'package:flutter/material.dart';

class IntroductoryPageThree extends StatelessWidget{
  const IntroductoryPageThree({super.key});


  void _printName(){
    print("hello");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            left: 20,
            right: 20,
            child: Image.asset("assets/images/intro_page_three.png", fit: BoxFit.cover)
            
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.55,
            left: 16,
            right: 16,
            child: Text(
              "Stay up to Date",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.blue[300]
              ),
            )
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.60,
            left: 16,
            right: 16,
            child: Text(
              "With our news feature, stay up to date on all news trends",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue[300]
              ),
            )
          ),


          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.23,
            left: 40,
            right: 40,
            height: 65,
            child: ElevatedButton(
              onPressed: _printName, 
              style: ElevatedButton.styleFrom(
              
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white, // text color within the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12)
                ),
                elevation: 0
              ),
               child: Text("Create an account", style: TextStyle(fontSize: 16),),
               
            )
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.12,
            left: 40,
            right: 40,
            height: 65,
            child: ElevatedButton(
              onPressed: _printName, 
              style: ElevatedButton.styleFrom(
              
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue, // text color within the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  side: BorderSide(color: Colors.blue, width: 1)
                ),
                elevation: 0
              ),
               child: Text("I already have an account", style: TextStyle(fontSize: 16),),
               
            )
          )
        ],
      ),
    );
  }
}