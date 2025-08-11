// import 'dart:ffi';

// import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/providers/auth_provider.dart';
import 'package:frontend/screens/auth/login_page.dart';
import 'package:frontend/screens/courseDetails/Investment/Investment_intro.dart';
import 'package:frontend/screens/courseDetails/stocks/stocks_intro.dart';
import 'package:frontend/screens/courseDetails/savings/savings_intro.dart';
import 'package:frontend/screens/home/lessonPage.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        backgroundColor: Colors.grey.shade100,
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


                SizedBox(height: 10,),      
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
                              style: TextStyle(fontSize:authProvider.userStreak != null ? 50: 20, color: Colors.white),),
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

                SizedBox(height: 20,),

                Padding(
                  padding: EdgeInsetsGeometry.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Lessons", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),),
                    ],
                  ),
                ),

                SizedBox(height: 20,),

                // horizontal scrollable
                Container(
                  width: screenWidth * 0.9,
                  height: screenWidth * 0.4,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.transparent),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        // continue your lesson
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => InvestmentIntro())
                            );
                          },
                          child: Container(
                            width: screenWidth * 0.4,
                            height: screenWidth * 0.35,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/investment.jpeg'),
                                fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.blue)
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12,),
                      //No idea yet
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => SavingsIntro())
                            );
                          },
                          child: Container(
                            width: screenWidth * 0.4,
                            height: screenWidth * 0.35,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/savings3.jpeg'),
                                fit: BoxFit.cover  
                              ),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.blue)
                            ),
                            
                          ),
                        ),
                      ),
                      SizedBox(width: 12,),
                      GestureDetector(
                        onTap: (){
                           Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => StocksIntro())
                            );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: screenWidth * 0.4,
                            height: screenWidth * 0.35,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/stocksImage.jpeg'),
                                fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.blue)
                            ),
                            child: Center(
                              child: Text("Stocks", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                            ),
                            
                          ),
                        ),
                      ),
                      SizedBox(width: 12,),
                    ],
                  ),
                ),

                // blue container beneath the screen
                SizedBox(height: 50),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => LessonScreen())
                      );
                    },
                    child: Container(
                      width: screenWidth * 0.9,
                      height: screenWidth * 0.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Student.jpeg',),
                          fit: BoxFit.cover
                        ),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10,left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Continue learning ", style: TextStyle(color: Colors.white, fontSize: 18),),
                
                              ],
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                width: screenWidth * 0.4,
                                child: Text('Understand basics of savings', style: TextStyle(fontSize: 15,color: Colors.white,), textAlign: TextAlign.left,),
                              ),
                            ],
                          ),

                          
                    
                          //play icon
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16,),
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
                  ),
                )

              ],
            ),
          ),
        )
    );
  
  }
}