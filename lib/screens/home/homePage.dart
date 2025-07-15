// import 'dart:ffi';

import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.blue[100]),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
              children: [
                // header section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Icon(
                                Icons.person_outline_rounded
                              ),
                            ),
                            SizedBox(width: 20,),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Welcome back"),
                                  SizedBox(height: 5,),
                                  Text("psam sap")
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ),

                  //top right corner
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20, top: 5),
                        child: FaIcon(FontAwesomeIcons.bell, color: Colors.blue,)
                      ),
                    )
                  ],
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(width: 1, color: Colors.blue),
                      color: Colors.blue
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16,),
                          child: Text("Track your expense"),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              shape: BoxShape.circle,
                              color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                //amount section
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Balance"),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          FaIcon(FontAwesomeIcons.dollarSign, color: Colors.blueGrey[700],),
                          SizedBox(width: 10,),
                          Text(
                            "100,345",
                            style: TextStyle(
                              fontSize: 24
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 8,),
                      Container(
                        width: 230,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(color: Colors.blue,width: 1),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: CountryFlag.fromCountryCode("US", height: 30, width: 30,),
                            ),
                            Text("DOLL - US Dollar"),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.blue, width: 2)
                              ),
                              child: Icon(Icons.expand_more, color: Colors.blue, size: 20,),
                            )
                          ],
                        )
                      )
                    ],
                  ),
                ),

                // third child
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Some other activities"),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(35),
                          border: Border.all(color: Colors.blue,)
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                          child: Text("See all"),
                        ),
                      )
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 180,
                              height: 150,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 225, 237, 247),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.blue)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.blue, width: 1),
                                        color: Colors.white
                                      ),
                                      child: Center(child: Image.asset('assets/images/book.png', width: 20, height: 20,)),
                                    ),
                                    Text("Continue lesson"),
                                    Text("Maintain your streak 🔥", style: TextStyle(color: Colors.grey[500]),),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 180,
                              height: 150,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 225, 237, 247),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.blue)
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 49,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.blue, width: 1),
                                        color: Colors.white
                                      ),
                                      child: Center(child: Image.asset("assets/images/controller.png", width: 20, height: 20,),),
                                    ),
                                    Text("Play games"),
                                    Text("Fun study games", style: TextStyle(color: Colors.grey[500]),)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: 180,
                              height: 150,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 225, 237, 247),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.blue)
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.blue, width: 1),
                                        color: Colors.white
                                      ),
                                      child: Center(child: Image.asset('assets/images/trending.png', width: 20, height: 20,),),
                                    ),
                                    Text("See what is trending"),
                                    Text("Top stories now",style: TextStyle(color: Colors.grey[500]),)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            // feedback section
                            Container(
                              width: 180,
                              height: 150,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 225, 237, 247),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.blue)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(color: Colors.blue, width: 1)
                                      ),
                                      child: Center(child: Image.asset('assets/images/feedback.png', width: 20, height: 20,),),
                                    ),
                                    Text("Provide Feedback",),
                                    Text("Help us grow", style: TextStyle(color: Colors.grey[500])),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                    
                      ],
                    ),
                  ),
                

              


              ],
            ),
          ),
        )
    );
  
  }
}