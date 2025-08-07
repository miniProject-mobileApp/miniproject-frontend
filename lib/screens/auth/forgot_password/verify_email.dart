import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/screens/auth/forgot_password/change_password_page.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:http/http.dart' as http;

class VerifyEmailPage extends StatefulWidget{
  final String email;
  const VerifyEmailPage ({super.key, required this.email});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  final _codeController = TextEditingController();
  bool _isLoading = false; 
  bool _isResending = false; // for resending the email

  final String _verifyCodeUrl = 'http://192.168.186.69:7000/api/v1/auth/verify'; 
  final String _resendCodeUrl = 'http://192.168.186.69:7000/api/v1/auth/forgotPassword'; 

  //function for resending
  Future <void> _verifyCodeFunction() async{
    final code = _codeController.text.trim();

    if(code.length != 5 || !RegExp(r'^\d{5}$').hasMatch(code)){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please provide a five digit code"), backgroundColor: Colors.red,)
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse(_verifyCodeUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': widget.email,
          'forgotPasswordCode': code
        })
      ).timeout(const Duration(seconds: 10), onTimeout: (){
        throw Exception('Request timed out');
      });

      final responseData = jsonDecode(response.body);

      if(response.statusCode == 200){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => ChangePasswordPage(email: widget.email)
          )
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'] ?? 'Code verified'))
        );
      }else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['error'] ?? 'Failed to verify code'))
        );
      }

    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error verifying code"),backgroundColor: Colors.red,)
      );
    }finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // function to resend the 
  Future<void> _resendCode() async{
    setState(() {
      _isResending = true;
    });

    try {
      final response = await http.post(
        Uri.parse(_resendCodeUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': widget.email})
      ).timeout(const Duration(seconds: 10), onTimeout: (){
        throw Exception('Request timed out');
      });

      final responseData = jsonDecode(response.body);

      if(response.statusCode == 200){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'] ?? 'code resent successfully'))
        );
      }else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['error'] ?? 'Failed to resend code'), backgroundColor: Colors.red,)
        );
      }
    } catch (e) {
      print("Error caused by $e");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Internal server error'), backgroundColor: Colors.red,)
      );
    }finally{
      setState(() {
        _isResending = false;
      });
    }
  }

  @override
  void dispose(){
    _codeController.dispose();
    super.dispose();
  }



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
                    controller: _codeController,
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
                onTap: _isResending ? null : _resendCode,
                child: Text(_isResending ? "Resending...": 'Resend code', style: TextStyle(fontSize: 17, color: Colors.blue),)
              ),

              SizedBox(height: 20,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: SizedBox(
                  width: screenWidth * 0.7,
                  height: 50,
                  child: ElevatedButton(
                  
                    onPressed: _isLoading ? null: _verifyCodeFunction,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                      foregroundColor: Colors.white
                    ),
                    child: _isLoading 
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Verify", style: TextStyle(fontSize: 18),)
                  ),
                )
              )
          
            ],
          ),
        ),
      ),
    );
  }
}


