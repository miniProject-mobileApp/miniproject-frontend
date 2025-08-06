import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/screens/auth/forgot_password/change_password_page.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyEmailPage extends StatelessWidget{
  const VerifyEmailPage ({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // double screenHeight= MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify your email'),
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
                              Icons.email_rounded,
                              size: 150,
                            ),
                          ),
                        
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
                  "Enter the 5 digit verification code", 
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18,),
                ),
              ),
          
              SizedBox(height: 10,),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 18, ),
                  child: PinCodeTextField(
                    appContext: context, 
                    length: 5,
                    cursorHeight: 20,
                    onChanged: (value) {
                      print(value);
                    },
                    enableActiveFill: true,
                    textStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldWidth: 50,
                      inactiveColor: Colors.grey, // color of bor der when inactive
                      activeColor: Colors.blue, // color of border when active
                      selectedColor: Colors.lightBlue,
                      activeFillColor: Colors.blue.shade400,
                      selectedFillColor: Colors.blue.shade200,
                      inactiveFillColor: Colors.grey.shade300,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(8)

                    ),
                  ),
                ),
              ),
          
              GestureDetector(
                onTap: (){
                  print("Code resent");
                },
                child: Text("Resend Code", style: TextStyle(fontSize: 17, color: Colors.blue),)
              ),

              SizedBox(height: 20,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: SizedBox(
                  width: screenWidth * 0.7,
                  height: 50,
                  child: ElevatedButton(
                  
                    onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => ChangePasswordPage())
                      );
                      // print("Password changed");
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                      foregroundColor: Colors.white
                    ),
                    child: Text("Verify", style: TextStyle(fontSize: 18),)),
                ),
              )
          
            ],
          ),
        ),
      ),
    );
  }

}


