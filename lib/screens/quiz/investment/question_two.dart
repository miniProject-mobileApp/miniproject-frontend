import 'package:flutter/material.dart';

class InvestMentQuizQuestionTwo extends StatelessWidget{
  const InvestMentQuizQuestionTwo({super.key});


  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // TODO: implement build
      return Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            children: [
              // heading
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Center(
                  child: Column(
                    children: [
                      Text("Basics of Investment Trivia", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                      SizedBox(height: 10,),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.circular(35)
                        ),
                        child: Center(child: Text("2", style: TextStyle(fontSize: 20, color: Colors.white),))
                      ),
                      SizedBox(height: 10,),
                      Text("10:24",style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),

              Container(
                width: screenWidth * 1,
                height: screenHeight * 0.78,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  color: Colors.white
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 40,),
                      //Question
                      Text("what is investment", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                      SizedBox(height: 20,),
                      // alternatives
                      Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.7,
                                    child: Text('A. this is absolutely the right option',)
                                  ),
                                  SizedBox(width: 30,),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Colors.blue),
                                      borderRadius: BorderRadius.circular(30)
                                    ),
                                  )
                                ],
                              ),

                              SizedBox(height: 35,),
                              //option B
                              Row(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.7,
                                    child: Text('B. this is absolutely the right option',)
                                  ),
                                  SizedBox(width: 30,),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Colors.blue),
                                      borderRadius: BorderRadius.circular(30)
                                    ),
                                  )
                                ],
                              ),

                              SizedBox(height: 35,),
                              //option C
                              Row(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.7,
                                    child: Text('C. this is absolutely the right option',)
                                  ),
                                  SizedBox(width: 30,),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Colors.blue),
                                      borderRadius: BorderRadius.circular(30)
                                    ),
                                  )
                                ],
                              ),

                              SizedBox(height: 35,),
                              // option D
                              Row(
                                children: [
                                  SizedBox(
                                    width: screenWidth * 0.7,
                                    child: Text('D. this is absolutely the right option',)
                                  ),
                                  SizedBox(width: 30,),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(width: 1, color: Colors.blue),
                                      borderRadius: BorderRadius.circular(30)
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 80,),
                              Container(
                                width: screenWidth * 0.9,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: Colors.grey)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: (){
                                          Future.delayed(Duration(milliseconds: 200), () {
                                            Navigator.pop(context);
                                          });
                                        },
                                        splashColor: const Color.fromARGB(255, 159, 206, 245),
                                        borderRadius: BorderRadius.circular(15),
                                        child: Ink(
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(color: Colors.transparent),
                                          child: Row(
                                            children: [
                                              Icon(Icons.arrow_back_ios_outlined, size: 16,),
                                              SizedBox(width: 10,),
                                              Text('Previous', style: TextStyle(fontSize: 16),),
                                              
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: (){
                                          print("Tapped");
                                        },
                                        splashColor: const Color.fromARGB(255, 159, 206, 245),
                                        borderRadius: BorderRadius.circular(15),
                                        child: Ink(
                                          padding: const EdgeInsets.all(8.0),
                                          decoration: BoxDecoration(color: Colors.transparent),
                                          child: Row(
                                            children: [
                                              Text('Next', style: TextStyle(fontSize: 16),),
                                              SizedBox(width: 10,),
                                              Icon(Icons.arrow_forward_ios, size: 16,)
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                              
                              
                            ],
                          ),
                          
                        ],
                      )                      
                    ],
                  ),
                ),
              )
            ],
          )
        ),
      );
  }
}