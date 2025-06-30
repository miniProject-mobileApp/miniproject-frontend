import 'package:flutter/material.dart';

class CompletedCourses extends StatelessWidget{
  const CompletedCourses({super.key});


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30,),
          // crypto
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: screenWidth * 0.9,
              height: 150,
              decoration: BoxDecoration(
                border: BoxBorder.all(width: 1, color: Colors.blue),
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
                      border: Border.all(width: 1, color: Colors.grey)
                    ),
                  ),

                  // descriptions (consisting of topic, tutor and progress)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Introduction to crypto currency"),
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
                                  value: 1.0,
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

          // forex
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Container(
              width: screenWidth * 0.9,
              height: 150,
              decoration: BoxDecoration(
                border: BoxBorder.all(width: 1, color: Colors.blue),
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
                      border: Border.all(width: 1, color: Colors.grey)
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
                                  value: 1.0,
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

          // block chain
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,),
            child: Container(
              width: screenWidth * 0.9,
              height: 150,
              decoration: BoxDecoration(
                border: BoxBorder.all(width: 1, color: Colors.blue),
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
                      border: Border.all(width: 1, color: Colors.grey)
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
                                  value: 1.0,
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
          )
        ],
      ),
    );
  }
}