import 'package:flutter/material.dart';


class CompletedCourses  extends StatelessWidget{
  const CompletedCourses ({super.key});


  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          // crypto
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Material(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                onTap: (){
                  print("Done");

                },
                splashColor: Colors.blue[200], // handles ripple color
                borderRadius: BorderRadius.circular(20),
                child: Ink(
                  width: screenWidth * 0.9,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: BoxBorder.all(width: 1, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3)
                      )
                    ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // image place holder
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1, color: Colors.transparent)
                        ), 
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(20), 
                          child: Image.asset('assets/images/crypto.jpeg', fit: BoxFit.cover,),
                        ),
                      ),
                      // descriptions (consisting of topic, tutor and progress)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Introduction to Investing"),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Icon(Icons.person),
                              SizedBox(width: 15,),
                              Text("by tutor-one"),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              SizedBox(
                                width: 180,
                                child: LinearProgressIndicator(
                                      value: 1,
                                      backgroundColor: Colors.blue[200],
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue,
                                      minHeight: 8,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Text("5/5", style: TextStyle(color: Colors.grey),)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          // forex
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Material(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                onTap: () {
                  Future.delayed(const Duration(milliseconds: 200), () {
                    print("Done");
                  });
                },
                splashColor: Colors.blue[200],
                borderRadius: BorderRadius.circular(20),
                child: Ink(
                  width: screenWidth * 0.9,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: BoxBorder.all(width: 1, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // image place holder
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1, color: Colors.transparent)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(20),
                          child: Image.asset('assets/images/forex.jpeg', fit: BoxFit.cover),
                        ),
                      ),
                
                      // descriptions (consisting of topic, tutor and progress)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Introduction to Forex trading "),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Icon(Icons.person),
                              SizedBox(width: 15,),
                              Text("by tutor-two"),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              SizedBox(
                                width: 180,
                                child: LinearProgressIndicator(
                                      value: 1,
                                      backgroundColor: Colors.blue[200],
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue,
                                      minHeight: 8,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Text("5/5", style: TextStyle(color: Colors.grey),)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          // block chain
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue.shade100,
              child: InkWell(
                onTap: (){
                  Future.delayed(const Duration(milliseconds: 200), (){
                    print("Done");
                  });
                },
                splashColor: Colors.blue[200],
                borderRadius: BorderRadius.circular(20),
                child: Ink(
                  width: screenWidth * 0.9,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: BoxBorder.all(width: 1, color: Colors.transparent),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // image place holder
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 1, color: Colors.transparent)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(20),
                          child: Image.asset('assets/images/blockChain.jpeg', fit: BoxFit.cover, )
                        ),
                        
                      ),
                
                      // descriptions (consisting of topic, tutor and progress)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Introduction to block chain"),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Icon(Icons.person),
                              SizedBox(width: 15,),
                              Text("by tutor-three"),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              SizedBox(
                                width: 180,
                                child: LinearProgressIndicator(
                                      value: 1,
                                      backgroundColor: Colors.blue[200],
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue,
                                      minHeight: 8,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Text("5/5", style: TextStyle(color: Colors.grey),)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}