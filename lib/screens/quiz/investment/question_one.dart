import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/screens/quiz/investment/results.dart';
import 'package:http/http.dart' as http;

class InvestMentQuizQuestionOne extends StatefulWidget{
  const InvestMentQuizQuestionOne({super.key});

  @override
  State<InvestMentQuizQuestionOne> createState() => _InvestMentQuizQuestionOneState();
}

class _InvestMentQuizQuestionOneState extends State<InvestMentQuizQuestionOne> {
  List <dynamic> questions = []; // Stores fetched questions from backend
  int currentQuestionIndex = 0; // Tracks current question
  int? _selectedIndex; // Tracks selected option
  List <int?> selectedAnswers = []; // stores answers

  @override
  void initState(){
    super.initState();
    fetchQuestions();
  }

  Future <void> fetchQuestions() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.186.69:7000/api/v1/quiz/start?topic=Investment'));
      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        setState(() {
          questions = data['questions'];
          selectedAnswers = List <int?>.filled(questions.length, null);
        });
      }else {
        // handle errors when questions is not successfully retrieved
        print('Failed to retrieve questions ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to load quiz question"))
        );
      }
    } catch (e) {
      print('Error fetching questions, $e');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error loading quiz questions"))
      );
    }
  }

  Future<Map<String, dynamic>> submitQuiz() async {
    try {
      final answers = questions.asMap().entries.map((entry) {
        int index = entry.key;
        dynamic question = entry.value;
        return {
          'questionId': question['_id'],
          'selectedOptions': selectedAnswers[index] != null ? ['A', 'B', 'C', 'D'] [selectedAnswers[index]!] : null
        };
      }).where((answer) => answer['selectedOptions'] != null).toList();

      final response = await http.post(
        Uri.parse('http://192.168.186.69:7000/api/v1/quiz/submit'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'topic': 'Investment',
          'answers': answers
        })
      );

      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        return {
          'score': data['score'], 
          'totalQuestions': questions.length
        };
      }else {
        print('Failed to submit quiz: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to submit quiz"))
        );
        return {
          'score': 0, 
          'totalQuestions': questions.length
        };
      }

    } catch (e) {
      print('Error submitting quiz $e');
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error submitting quiz"))
      );
      return {'score': 0, 'totalQuestions': questions.length};
    }
  }

  void goToNextQuestion() {
    if(_selectedIndex != null){
      setState(() {
        selectedAnswers[currentQuestionIndex] = _selectedIndex;
        if(currentQuestionIndex < questions.length - 1 ){
          currentQuestionIndex++;
          _selectedIndex = selectedAnswers[currentQuestionIndex];
        }else {
          submitQuiz().then((result) {
            Navigator.pushReplacement(
            context, 
            MaterialPageRoute(
              builder: (context) => InvestmentQuizResultScreen(
                questions: questions,
                selectedAnswers: selectedAnswers,
                score: result['score'],
                totalQuestions: result['totalQuestions']
              )
            )
            );
          });
          
        }
      });
    }else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please select an answer"))
      );
    }
  }

  void goToPreviousQuestion() {
    setState(() {
      selectedAnswers[currentQuestionIndex] = _selectedIndex;
      currentQuestionIndex--;
      _selectedIndex = selectedAnswers[currentQuestionIndex];
    });
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    if(questions.isEmpty){
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final currentQuestion = questions[currentQuestionIndex];
    final options = currentQuestion['options'] as Map<String, dynamic>;


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
                        child: Center(child: Text("${currentQuestionIndex + 1}", style: TextStyle(fontSize: 20, color: Colors.white),))
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
                      Text(
                        currentQuestion['question'], 
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20,),
                      // alternatives
                      Row(
                        children: [
                          Expanded(
                            child: Column( 
                              children: List.generate(4, (index) {
                                final optionKey = ['A', 'B', 'C', 'D'][index];
                                final optionText = options[optionKey];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 35),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: screenWidth * 0.7,
                                        child: Text('$optionKey. $optionText'),
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
                      SizedBox(
                        width: screenWidth * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if(currentQuestionIndex > 0)
                              Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: (){
                                          Future.delayed(Duration(milliseconds: 200), () {
                                            goToPreviousQuestion();
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
                                    )
                              
                            else 
                              const SizedBox(width: 18),
                            Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: _selectedIndex != null 
                                    ? () {
                                        Future.delayed(Duration(milliseconds: 200), () {
                                          goToNextQuestion();
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
                              ),
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