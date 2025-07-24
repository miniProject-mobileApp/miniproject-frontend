import 'package:flutter/material.dart';
import 'package:frontend/screens/quiz/investment/question_two.dart';

class InvestMentQuizQuestionOne extends StatefulWidget{
  const InvestMentQuizQuestionOne({super.key});

  @override
  State<InvestMentQuizQuestionOne> createState() => _InvestMentQuizQuestionOneState();
}

class _InvestMentQuizQuestionOneState extends State<InvestMentQuizQuestionOne> {
  int? _selectedIndex;

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
                        child: Center(child: Text("1", style: TextStyle(fontSize: 20, color: Colors.white),))
                      ),
                      SizedBox(height: 10,),
                      Text("10:24",style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),

              // white background
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
                          Expanded(
                            child: Column( 
                              children: List.generate(4, (index) {
                                // Defining option labels
                                const options = [
                                  // Define option labels
                                  'A. This is the right option',
                                  'B. This is the right option',
                                  'C. This is the right option',
                                  'D. This is the right option',
                                ];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 35),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.7,
                                        child: Text(options[index]),
                                      ),
                                      const SizedBox(width: 30,),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            _selectedIndex = index;
                                          });
                                        },
                                        splashColor: Colors.blue.withValues(alpha: 0.2),
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          width: 40, 
                                          height: 40,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _selectedIndex == index
                                              ? Colors.blue // when selected
                                              : Colors.transparent,
                                            border: Border.all(width: 1, color: Colors.blue)
                                          ),
                                          child: _selectedIndex == index
                                                  ? const Center(
                                                    child: Icon(
                                                      Icons.circle,
                                                      size: 20,
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                  : null
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              })
                            ),
                          ),
                        ],
                      ),  

                      const SizedBox(height: 50,),
                      Container(
                        width: screenWidth * 0.9,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: _selectedIndex != null 
                                  ? () {
                                      Future.delayed(Duration(milliseconds: 200), () {
                                         Navigator.push(
                                          context, 
                                          MaterialPageRoute(builder: (context) => InvestMentQuizQuestionTwo())
                                        );
                                      });
                                    }
                                  : null,
                                splashColor: const Color.fromARGB(255, 159, 206, 245),
                                borderRadius: BorderRadius.circular(15),
                                child: Ink(
                                  padding: const EdgeInsets.all(8),
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
                ),
              )
            ],
          )
        ),
      );
  }
}