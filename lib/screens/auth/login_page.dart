import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/screens/auth/forgot_password/forgot_password_page.dart';
import 'package:frontend/screens/auth/signUpPage.dart';
import 'package:frontend/screens/home/basePage.dart';
// import 'package:frontend/screens/oldLoginPage.dart';
import 'package:frontend/services/login_service.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = false;

  //text controllers for text fields
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final LoginService _loginService = LoginService();

  //loading states 
  bool _isLoading = false;
  String? _errorMessage;


  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //login button logic
  Future<void> _handleLogin() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    //validation
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if(email.isEmpty || password.isEmpty){
      setState(() {
        _isLoading = false;
        _errorMessage = 'Please fill all fields';
      });
      return;
    }

    try {
      final response = await _loginService.login(
        email: email, 
        password: password
      );

      //navigate to base screen if successful
      if(mounted){
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => const BaseScreen())
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
                //blue background
                Container(
                  width: screenWidth * 1,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(100),
                      bottomLeft: Radius.circular(100)
                    )
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 20),
                        child: IconButton(
                          onPressed: (){
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => SignUpScreen())
                            );
                          },
                          icon: Icon(Icons.arrow_back, size: 30, color: Colors.white,)
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          "assets/images/mdi_finance.png",
                          fit: BoxFit.contain,
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ],
                  )
                ),

                //email address
                Padding(
                  padding: const EdgeInsets.only(top:80),
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    height: 50,
                    child: TextSelectionTheme(
                      data: TextSelectionThemeData(
                        selectionColor: Colors.blue.withValues(alpha: 0.4),
                        selectionHandleColor: Colors.blue
                      ),
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
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          suffixIcon: Icon(Icons.email_outlined),
                          suffixIconColor: Colors.blue
                        ),
                      ),
                    ),
                  ),
                ),

                //password
                Padding(
                  padding: const EdgeInsets.only(top:45),
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    height: 50,
                    child: TextSelectionTheme(
                      data: TextSelectionThemeData(
                        selectionColor: Colors.blue.withValues(alpha: 0.4),
                        selectionHandleColor: Colors.blue
                      ),
                      child: TextField(
                        controller: _passwordController,
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
                          labelText: "password",
                          labelStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            }, 
                            icon: Icon(
                              isPasswordVisible ? Icons.visibility_off : Icons.visibility
                            )
                          ),
                          suffixIconColor: Colors.blue,
                        ),
                        obscureText: !isPasswordVisible,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20,),

                //forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => ForgotPasswordPage())
                          );
                        },
                        child: Text("Forgot Password?", style: TextStyle(fontSize: 15, color: Colors.blue),)
                      )
                    ],
                  ),
                ),
                
                SizedBox(height: 20,),

                //Error message display
                if(_errorMessage != null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, ),
                    child: Text(
                      _errorMessage!,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                  ),
                

                SizedBox(height: 30,),
                

                // login button
                SizedBox(
                  width: screenWidth * 0.7,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleLogin, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      overlayColor: Colors.transparent.withValues(alpha: 0.2) // gives the opacity vibe when clicked on
                    ),
                    child: _isLoading 
                          ? CircularProgressIndicator(color: Colors.white,)
                          : Text("Login", style: TextStyle(color: Colors.white),)
                  ),
                ),

                //OR
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(child: Container(height: 1, width: 150,color: Colors.blue,),),
                      Text('OR', style: TextStyle(color: Colors.blue, fontSize: 14),),
                      SizedBox(child: Container(height: 1, width: 150,color: Colors.blue,),),
                    ],
                  ),
                ),

                //sign in with google
                Material(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(35),
                  child: InkWell(
                    onTap: (){
                      Future.delayed(const Duration(milliseconds: 300), () {
                        print("Login in with google");
                      });
                    },
                    splashColor: Colors.blue[200],
                    borderRadius: BorderRadius.circular(35),
                    child: Ink(
                      width: screenWidth * 0.7,
                      height: 50,
                      decoration: BoxDecoration(
                        border: BoxBorder.all(width: 1, color: Colors.blue),
                        borderRadius: BorderRadius.circular(35)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Login in with google", style: TextStyle(color: Colors.blue),),
                          Image.asset('assets/images/google.png')
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
        )
      )
    );
  }
}