import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:frontend/screens/onboardingScreen.dart';


class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return AnnotatedRegion<SystemUiOverlayStyle>( // controls status bar color
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      ),
      child: Scaffold(
        body: Stack(
          children: [
            //blue background on the top of the screen
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 420,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100)
                  ) 
                ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => OnboardingScreen())
                            );
                          } ,
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,
                            color: Colors.white
                          ),
                        ),
                      ),
                      //centered image
                      Center(
                        child: Image.asset(
                          'assets/images/mdi_finance.png',
                          fit: BoxFit.contain,
                          height: 100,
                          width: 100,
                        ),
                      )
                    ],
                  ),
              ),
            ),

            //log in form
            Positioned(
              top: screenHeight * 0.35,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const Text(
                  "Email Address",

                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue
                  )
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: screenWidth - 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(color: Colors.grey, width: 1) // border color and width, when not active
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(color: Colors.blue, width: 2)
                      ),
                      hintText: "example@gmail.com",
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      suffixIcon: Icon(Icons.email),
                      suffixIconColor: Colors.blue
                    ),
                  ),
                ),
                

                
                
              ],
              ),
              
            )

            
  
          ],
        )
      ),
      
    );

  }
}