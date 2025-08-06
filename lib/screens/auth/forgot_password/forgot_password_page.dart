import 'package:flutter/material.dart';
import 'package:frontend/screens/auth/forgot_password/verify_email.dart';

class ForgotPasswordPage extends StatelessWidget{
  const ForgotPasswordPage ({super.key});


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
                  
                    onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => VerifyEmailPage())
                      );
                      // print("Password changed");
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                      foregroundColor: Colors.white
                    ),
                    child: Text("Send code", style: TextStyle(fontSize: 18),)),
                ),
              )
          
            ],
          ),
        ),
      ),
    );
  }
}