import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/screens/auth/login_page.dart';
import 'package:frontend/screens/home/basePage.dart';
import 'package:frontend/screens/oldLoginPage.dart';
// import 'package:frontend/screens/oldLoginPage.dart';
import 'package:frontend/services/sign_up_service.dart';

class SignUpScreen extends StatefulWidget{
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // boolean to control password visibility
  bool isPasswordVisible = false;

  //Text controllers for text fields
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();


  final SignUpService _signUpService = SignUpService();

  //loading states
  bool _isLoading = false;
  String? _errorMessage; 

  @override
  void dispose(){
    // disposing controllers to free up resources
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
     _phoneController.dispose();
    super.dispose();
  }

  //handle sign up button press
  Future<void> _handleSignUp() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    
    //client side validation
    final firstName = _firstNameController.text.trim(); 
    final lastName = _lastNameController.text.trim(); 
    final email = _emailController.text.trim(); 
    final password = _passwordController.text.trim(); 
    final confirmPassword = _confirmPasswordController.text.trim();
    final phone = _phoneController.text.trim();

    if(firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        phone.isEmpty 
      ){
        setState(() {
          _isLoading = false;
          _errorMessage = 'Please fill all fields...';
        });
        return;
      }

      if(password != confirmPassword){
        setState(() {
          _isLoading = false;
          _errorMessage = 'Passwords do not match';
        });
        return;
      }

      if(phone.length < 10){
        setState(() {
          _isLoading = false;
          _errorMessage = 'Phone must be 10 digits long';
        });
        return;
      }

      if(password.length < 5){
        setState(() {
          _isLoading = false;
          _errorMessage = 'Password must be at least 5 characters long';
        });
        return;
      }
    

      try {
        final response = await _signUpService.signUp(
          firstName: firstName, 
          lastName: lastName, 
          email: email, 
          password: password, 
          confirmPassword: confirmPassword, 
          phone: phone
        );

        //navigate to base screen if it is successful
        if(mounted){
          Navigator.pushReplacement(
            context, 
            MaterialPageRoute(builder: (context) => const LoginPage())
          );
        }
      } catch (e) {
          setState(() {
            _errorMessage = e.toString();
          });
        }finally{
          setState(() {
            _isLoading = false;
          });
        }
  } 
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      ),
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                // blue part of the screen
                Container(
                  width: screenWidth * 1,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100)
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/mdi_finance.png",
                      fit: BoxFit.contain,
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
          
                //first name
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 170,
                        height: 50,
                        child: TextField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Colors.grey)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(width: 1, color: Colors.blue)
                            ),
                            labelText: "first name",
                            labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5)
                          ),
                        ),
                      ),
                      // last name
                      SizedBox(
                        width: 170,
                        height: 50,
                        child: TextField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Colors.grey)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(width: 1, color: Colors.blue)
                            ),
                            labelText: "last name",
                            labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5)
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                
                // email
                Padding(
                  padding: EdgeInsets.symmetric( horizontal: 16, vertical: 30),
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    height: 50,
                    child: TextField(
                      controller: _emailController,
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(color: Colors.grey)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(color: Colors.blue)
                        ),
                        labelText: "email",
                        labelStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                        suffixIcon: Icon(Icons.email_outlined),
                        suffixIconColor: Colors.blue
                      ),
                    ),
                  ),
                ),

                // phone
                Padding(
                  padding: EdgeInsets.symmetric( horizontal: 16, ),
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    height: 50,
                    child: TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(color: Colors.grey)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(color: Colors.blue)
                        ),
                        labelText: "phone",
                        labelStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                        suffixIcon: Icon(Icons.phone_enabled_outlined),
                        suffixIconColor: Colors.blue
                      ),
                    ),
                  ),
                ),

                //password and confirm password
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // password
                      SizedBox(
                        width: 170,
                        height: 50,
                        child: TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(width: 1, color: Colors.grey)
                            ),
                            focusedBorder:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(width: 1, color: Colors.blue)
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              icon: Icon(
                                isPasswordVisible ? Icons.visibility_off : Icons.visibility
                              ),
                            ),
                            suffixIconColor: Colors.blue,
                            labelText: "password",
                            labelStyle: TextStyle(color: Colors.grey)
                          ),
                          obscureText: !isPasswordVisible,
                        )
                      ),
                      //confirm password
                      SizedBox(
                        width: 170,
                        height: 50,
                        child: TextField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(width: 1, color: Colors.grey)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(width: 1, color: Colors.blue)
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                              icon: Icon(
                                isPasswordVisible ? Icons.visibility_off : Icons.visibility
                              ),
                            ),
                            suffixIconColor: Colors.blue,
                            labelText: "confirm password",
                            labelStyle: TextStyle(color: Colors.grey)
                          ),
                          obscureText: !isPasswordVisible,
                        )
                      ),
                    ],
                  ),
                ),

                //Error message display
                if(_errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      _errorMessage!,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),


                SizedBox(height: 20,),

                //sign up button
                SizedBox(
                  width: screenWidth * 0.7,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleSignUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      overlayColor: Colors.transparent.withValues(alpha: 0.2)
                    ),
                    child: _isLoading 
                          ? CircularProgressIndicator(color: Colors.white,) 
                          : Text("Sign up", style: TextStyle(color: Colors.white, fontSize: 16),),
                  ),
                ),

                // lines for "or"]
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(child: Container(height: 1, width: 150,color: Colors.blue,)),
                    Text("OR", style: TextStyle(color: Colors.blue, fontSize: 14),),
                    SizedBox(child: Container(height: 1, width: 150,color: Colors.blue,))
                  ],
                ),

                // sign up with google
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: screenWidth * 0.7,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => BaseScreen())
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: BorderSide(color: Colors.blue)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Sign up with Google", style: TextStyle(color: Colors.blue, fontSize: 16), ),
                          Image.asset("assets/images/google.png")
                        ],
                      ),
                    ),
                  ),
                ),

                //already have an account
                SizedBox(height: 10,),

                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 15),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => LoginPage())
                          );
                        },
                        child: Text("Log in", style: TextStyle(color: Colors.blue, fontSize: 17),)
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}