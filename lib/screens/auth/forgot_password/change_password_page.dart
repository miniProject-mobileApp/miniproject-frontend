import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/screens/auth/login_page.dart';
import 'package:http/http.dart' as http;


class ChangePasswordPage extends StatefulWidget{
  //taking email as a parameter
  final String email;
  const ChangePasswordPage ({super.key, required this.email});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  final String _backendUrl = 'http://192.168.186.69:7000/api/v1/auth/updatePassword';

  //function to update the password
  Future<void> _setNewPassword() async {
    final newPassword = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if(newPassword.isEmpty || confirmPassword.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter all fields"))
      );
      return;
    }
    
    if(newPassword != confirmPassword){
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Passwords do not match"))
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
        body: jsonEncode({
          'email': widget.email,
          'newPassword': newPassword,
          'confirmNewPassword': confirmPassword
        })
      );

      final responseData = jsonDecode(response.body);
      if(response.statusCode == 200){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => LoginPage()
          )
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['message'] ?? 'Password updated'))
        );
      }else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseData['error'] ?? 'Password unable to update'), backgroundColor: Colors.red,)
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
                  "Reset your password", 
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18,),
                ),
              ),
          
              SizedBox(height: 30,),
          
              Padding(
                padding: const EdgeInsets.only(top: 20),
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
                      controller: _newPasswordController,
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        hintText: 'enter your new password',
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
                padding: const EdgeInsets.only(top: 20),
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
                      controller: _confirmPasswordController,
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        hintText: 'confirm password',
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

              SizedBox(height: 50,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16,),
                child: SizedBox(
                  width: screenWidth * 0.7,
                  height: 50,
                  child: ElevatedButton(
                  
                    onPressed: _isLoading ? null : _setNewPassword,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade300,
                      foregroundColor: Colors.white
                    ),
                    child: _isLoading 
                          ? CircularProgressIndicator(color: Colors.white,)
                          : Text("Change Password")
                  ),
                )
              ),

              SizedBox(height: 30,)
          
            ],
          ),
        ),
      ),
    );
  }
}