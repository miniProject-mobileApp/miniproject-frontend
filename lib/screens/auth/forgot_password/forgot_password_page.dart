import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/screens/auth/forgot_password/verify_email.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordPage extends StatefulWidget{
  const ForgotPasswordPage ({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  // set _loading to track the progress of the request
  // set to false when the request hasn't yet started and set to true when started
  bool _isLoading = false;

  final String _backendUrl = 'http://192.168.186.69:7000/api/v1/auth/forgotPassword';

  //function to send email to the backend
  Future<void> _sendForgotPasswordCode() async{
    final email = _emailController.text.trim();

    if(email.isEmpty ||!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid email address"))
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse(_backendUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email})
      );

      final responseData = jsonDecode(response.body);

      if(response.statusCode == 200){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => VerifyEmailPage(email:email)
          )
        );
        ScaffoldMessenger.of(context).showSnackBar(
          // shows the message from the backend
          // takes the message field from the response object
          SnackBar(content: Text(responseData['message'] ?? "Forgot password code sent"))
        );
      }else {
        // show error message from backend
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['error'] ?? 'Forgot password code not sent'), backgroundColor: Colors.red,), 
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error connecting to server'), backgroundColor: Colors.red,)
      );
    }finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // double screenHeight= MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.transparent),
                        color: Colors.blue.shade100,
                        shape: BoxShape.circle 
                      ),
                      clipBehavior: Clip.antiAlias, 
                      child: Stack(
                        children: [
                          Center(
                            child: Icon(
                              Icons.lock,
                              size: 150,
                            ),
                          ),
                          Positioned(
                            bottom: 50,
                            right: 60,
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white
                              ),
                              child: Icon(Icons.question_mark_sharp, size: 30,)
                              )
                          )
                        ],
                      )
                    ),
                  ),
                ],
              ),
          
              SizedBox(height: 30,),
              
              SizedBox(
                width: screenWidth * 0.75,
                child: Text(
                  "Please Enter your email to receive the verification code", 
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18,),
                ),
              ),
          
              SizedBox(height: 30,),
          
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  width: screenWidth * 0.8,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                            textSelectionTheme: TextSelectionThemeData(
                              cursorColor: Colors.blue,
                              selectionColor: Colors.blue.withValues(alpha: 0.4),
                              selectionHandleColor: Colors.blue
                            ),
                          
                    ),
                    child: TextField(
                      controller: _emailController,
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        hintText: 'example@gmail.com',
                        suffixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(color: Colors.blue),
                        )
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                child: SizedBox(
                  width: screenWidth * 0.7,
                  height: 50,
                  child: ElevatedButton(

                    onPressed: _isLoading ? null : _sendForgotPasswordCode,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                      foregroundColor: Colors.white
                    ),
                    child: _isLoading 
                        ? CircularProgressIndicator(color: Colors.white)
                        :Text("Send code", style: TextStyle(fontSize: 18),)),
                ),
              )
          
            ],
          ),
        ),
      ),
    );
  }
}