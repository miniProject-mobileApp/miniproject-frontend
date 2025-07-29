import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';
import 'package:http/http.dart' as http;


class InvestmentQuizResultScreen extends StatefulWidget{
  final List<dynamic> questions;
  final List<int?> selectedAnswers;
  final int score;
  final int totalQuestions;

  const InvestmentQuizResultScreen({
    super.key,
    required this.questions,
    required this.selectedAnswers,
    required this.score,
    required this.totalQuestions,
  });

  @override
  State<InvestmentQuizResultScreen> createState() => _InvestmentQuizResultScreenState();
}

class _InvestmentQuizResultScreenState extends State<InvestmentQuizResultScreen> {
  List<dynamic> correctAnswers = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchCorrectAnswers();
  }

  Future<void> fetchCorrectAnswers() async {
    try {
      final questionIds = widget.questions.map((q) => q['_id']).toList();
      final response = await http.post(
        Uri.parse('http://192.168.186.69:7000/api/v1/quiz/answers'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'questionIds': questionIds}) // questionIds are sent to the backend in the req.body as an array
      );
      if(response.statusCode == 200){
        setState(() {
          correctAnswers = jsonDecode(response.body)['answers'];
          isLoading = false;
        });
      }else if (response.statusCode == 404){
        setState(() {
          isLoading = false;
          errorMessage = 'No answers found for the provided question';
        });
        print('$errorMessage');
      }else if (response.statusCode == 400){
        setState(() {
          isLoading = false;
          errorMessage = 'There is a problem with one or more of the question ids';
        });
        print('$errorMessage');
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'Failed to fetch answers ${response.statusCode}';
        });
        print('Failed to fetch answers ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Error fetching answers $e';
      });
      print('Error fetching answers $e');
    }
    
  }


  @override
  Widget build(BuildContext context) {
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;


    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz result", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: screenWidth * 1,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70)
                  )
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: CircularPercentIndicator(
                            animation: true,
                            animationDuration: 1000,
                            radius: 100,
                            lineWidth: 15,
                            percent:widget.totalQuestions > 0 ? widget.score / widget.totalQuestions : 0,
                            progressColor: Colors.blue.shade200,
                            backgroundColor: Colors.white,
                            circularStrokeCap: CircularStrokeCap.round, // ends of the progress indicator
                            center: Text("${widget.score}", style: TextStyle(fontSize: 60, color: Colors.white, fontWeight: FontWeight.bold), ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        height: 45,
                        width: screenWidth * 0.6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon( 
                              widget.score < 5 
                              ? Icons.sentiment_dissatisfied_outlined
                              : widget.score < 8
                                ? Icons.sentiment_neutral_outlined
                                : Icons.sentiment_satisfied_alt_outlined, 
                              color: widget.score < 5
                                    ? Colors.red
                                    : widget.score < 8
                                      ? Colors.amber
                                      : Color.fromARGB(255, 126, 228, 130),
                            ),
                            Text(
                              // widget.totalQuestions > 0 && widget.score /widget.totalQuestions >= 0.9 
                              widget.score < 5
                              ? 'Low Effort' 
                              : widget.score < 8
                                ? 'Good Effort'
                                : 'Outstanding',
                              style: TextStyle(
                                fontSize: 20, 
                                color: widget.score < 5
                                        ? Colors.red
                                        : widget.score < 8
                                          ? Colors.amber
                                          : Color.fromARGB(255, 126, 228, 130)
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // Number of correct and wrong answers
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: SizedBox(
                  width: screenWidth * 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // correct answers
                      Container(
                        height: screenHeight * 0.16,
                        width: screenWidth * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(18)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.check_circle, color: Color.fromARGB(255, 126, 228, 130), size: 30,),
                            Text('${widget.score}', style: TextStyle(fontSize: 28, color: Color.fromARGB(255, 126, 228, 130)),),
                            Text('correct'),
                          ],
                        ),
                      ),
                      //wrong answers
                      Container(
                        height: screenHeight * 0.16,
                        width: screenWidth * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(18)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.cancel, color: Colors.red, size: 30,),
                            Text('${widget.totalQuestions - widget.score}', style: TextStyle(fontSize: 24, color: Colors.red),),
                            Text('wrong'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.book, color: Colors.blue,),
                    SizedBox(width: 15,),
                    Text("Detailed Analysis",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                  ],
                ),
              ),
              if(isLoading)
                Center(child: CircularProgressIndicator(color: Colors.blue,),)
              else if (errorMessage != null)
                Column(
                  children: [
                    Text(errorMessage!, style: TextStyle(color: Colors.red, fontSize: 16)),
                    ElevatedButton(
                      onPressed: fetchCorrectAnswers,
                      child: Text('Retry'),
                    ),
                  ],
                )
              else if (correctAnswers.isEmpty)
              Column(
                children: [
                  Text('No correct answers received', style: TextStyle(color: Colors.red, fontSize: 16)),
                  ElevatedButton(
                    onPressed: fetchCorrectAnswers,
                    child: Text('Retry'),
                  ),
                ],
              )
              else if (correctAnswers.length != widget.questions.length)
                Center(child: Text('Error: Incomplete answer data', style: TextStyle(color: Colors.red, fontSize: 16)))
              else 
                ...widget.questions.asMap().entries.map((entry) {
                  int index = entry.key;
                  dynamic question = entry.value;
                  String? userAnswer = widget.selectedAnswers[index] != null && 
                          // for debugging
                          widget.selectedAnswers[index]! < 4 &&
                          question['options'] != null &&
                          question['options'][['A', 'B', 'C', 'D'][widget.selectedAnswers[index]!]] != null
                        ?  "${question['options'][['A', 'B', 'C', 'D'][widget.selectedAnswers[index]!]]}"
                        : 'Not answered';
                  String correctAnswer = correctAnswers[index]['answer'] ?? 'Unknown';
                  bool isCorrect = widget.selectedAnswers[index] != null &&
                      widget.selectedAnswers[index]! < 4 &&
                      ['A', 'B', 'C', 'D'][widget.selectedAnswers[index]!] == correctAnswer;
                  print('Question ${index + 1}: UserAnswer=$userAnswer, CorrectAnswer=$correctAnswer, IsCorrect=$isCorrect');
                  
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent
                        ),
                        child: Container(
                        width: screenWidth * 1,
                        // height: screenHeight * 0.12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(
                            color: Colors.transparent
                          )
                        ),
                        child: ExpansionTile(
                          leading: Icon(
                            isCorrect ? Icons.check_circle : Icons.cancel,
                            color: isCorrect ? Color.fromARGB(255, 126, 228, 130): Colors.red,
                            size: 30,
                          ),
                          title: Text("Question ${index + 1}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          subtitle: Text(question['question'] ?? 'No question text',style: TextStyle(color: Colors.grey),),
                          tilePadding: EdgeInsets.symmetric(horizontal: 16),
                          childrenPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          initiallyExpanded: false,
                          shape: Border(
                            top: BorderSide(color: Colors.transparent),
                            bottom: BorderSide(color: Colors.transparent)
                          ),
                          collapsedShape: Border(
                            top: BorderSide(color: Colors.transparent),
                            bottom: BorderSide(color: Colors.transparent)
                          ),
                          children: [
                            ListTile(
                              title: Text('Your answer: $userAnswer'),
                            ),
                            ListTile(
                              title: Text(
                                "Correct answer: $correctAnswer${correctAnswer != 'Unknown' ? ': ${question['options']?[correctAnswer] ?? 'N/A'}' : ''}",
                              ),
                            ),
                          ]
                        )
                      )
                    ),
                  );
                }).toList(),
                SizedBox(height: 20,)
            ],
          ),
        )
    );
  }
}