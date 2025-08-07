// import 'dart:ffi';

// import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/providers/auth_provider.dart';
import 'package:frontend/screens/auth/login_page.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;

    //redirect to login page if not authenticated
    if(!authProvider.isAuthenticated){
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => LoginPage())
        );
      });
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: Colors.blue,),
        )
      );
    } 

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
                        padding: EdgeInsets.only(top: 40, left: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: Colors.blue),
                                  borderRadius: BorderRadius.circular(30),
                                  
                                ),
                                child: Icon(Icons.person),
                              
                              ),
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Text(
                                    authProvider.userName != null
                                      ? "Welcome back, ${authProvider.userName}" 
                                      : "Loading...", 
                                    style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),)
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 2),
                                  child: Text("Continue your financial lit journey", style: TextStyle(fontSize: 12, color: Colors.blue),),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ),

                  //top right corner
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50, right: 18),
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.blue),
                            borderRadius: BorderRadius.circular(35)
                          ),
                          child: Icon(Icons.notifications_none_outlined),
                        ),
                      ),
                    )
                  ],
                ),


                //Total Balance
                SizedBox(height: 25,),

                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Current balance", style: TextStyle(fontSize: 12, color: Colors.blue),),
                          Text("GHC 450,000", style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold ),)
                        ],
                      ),
                    ],
                  ),
                ),

               // Streak section
               Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 20),
                child: Container(
                  width: screenWidth * 0.9,
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient( // handles color flow
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.blue.withValues(alpha: 0.8),
                        Colors.blue.withValues(alpha: 0.2)
                      ]
                    ),
                    border: Border.all(width: 1, color: Colors.blue),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 15),
                        child: Row(
                          children: [
                            FaIcon(FontAwesomeIcons.fire, size: 25, color: Colors.white,),
                            SizedBox(width: 10,),
                            Text("DAILY STREAK", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                            SizedBox(width: 100),
                            Container(
                              width: 80,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Colors.transparent),
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.blue
                              ),
                              child: Center(child: Text(authProvider.userStreak != null 
                                ? "${authProvider.userStreak} days"
                                : "Loading...",
                              style: TextStyle(color: Colors.white),)),
                            )
                          ],
                        ),
                      ),

                      //Daily streak
                      SizedBox(height: 25,),
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Text(authProvider.userStreak != null 
                            ? "${authProvider.userStreak}"
                            : "Loading...", 
                          style: TextStyle(fontSize: 50, color: Colors.white),),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Keep it up, you are doing well", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),),
                              Text("Complete a lesson today to maintain your streak", style: TextStyle(fontSize: 10, color: Colors.white),)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

                SizedBox(height: 15,),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            //continue lesson
                            Container(
                              width: 180,
                              height: 130,
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
                                    Row(
                                      
                                      children: [
                                        Text("Lessons done", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
                                        SizedBox(width: 10,),
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

                                      ],
                                    ),
                                    Text("12/24", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey), ),
                                    SizedBox(
                                      width: 150,
                                      child: LinearProgressIndicator(
                                        value: 0.1,
                                        backgroundColor: Colors.blue[200],
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blue,
                                        minHeight: 8,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            //play games
                            Container(
                              width: 180,
                              height: 130,
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
                            //see what is trending
                            Container(
                              width: 180,
                              height: 130,
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
                                    Row(
                                      children: [
                                        Text("Continue reading", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
                                        SizedBox(width: 5,),
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
                                      ],
                                    ),
                                    Text("Top stories now",style: TextStyle(color: Colors.grey[500]),),
                                    SizedBox(
                                      width: 150,
                                      child: LinearProgressIndicator(
                                        value: 0.1,
                                        backgroundColor: Colors.blue[200],
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.blue,
                                        minHeight: 8,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            // feedback section
                            Container(
                              width: 180,
                              height: 130,
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
                                    Row(
                                      children: [
                                        Text("Give Feedback", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
                                        SizedBox(width: 20,),
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
                                      ],
                                    ),
                                    Text("Tell us more", style: TextStyle(color: Colors.black),),
                                    Text("Help us grow", style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // blue container beneath the screen
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      width: screenWidth * 0.9,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10,left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Continue learning ", style: TextStyle(color: Colors.white),),
                                SizedBox(width: 140,),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    width: 80,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 225, 237, 247),
                                      borderRadius: BorderRadius.circular(12)
                                    ),
                                    child: Center(child: Text("continue", style: TextStyle(color: Colors.blue),)),
                                  ),
                                )
                              ],
                            ),
                          ),

                          SizedBox(height: 10,),

                          //play icon
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                            child: Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Icon(Icons.play_arrow, color: Colors.blue,),
                                ),

                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Understanding the fundamentals of savings", style: TextStyle(fontSize: 12, color: Colors.white),),
                                    SizedBox(height: 5,),                 
                                    SizedBox(
                                      width: 280,
                                      child: LinearProgressIndicator( //
                                          value: 0.8,
                                          backgroundColor: Colors.blue[200],
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.white,
                                          minHeight: 8,
                                        ),
                                    ),                                  
                                  ],
                                )
                              ],
                            ),
                          )
                        ],

                      ),
                    ),
                  )

              ],
            ),
          ),
        )
    );
  
  }
}