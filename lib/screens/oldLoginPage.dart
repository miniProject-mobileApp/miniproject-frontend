import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:frontend/screens/home/basePage.dart';
import 'package:frontend/screens/onboardingScreen.dart';
import 'package:frontend/screens/auth/signUpPage.dart';


class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false; // handles visibility on the password text


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return AnnotatedRegion<SystemUiOverlayStyle>( // controls status bar color
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      ),
      child: Scaffold(
        body: Stack(
          children: [
            //blue background on the top of the screen
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 420,
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
                        padding: const EdgeInsets.all(30),
                        // back arrow
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context, 
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => SignUpScreen(),
                                transitionsBuilder: (context, animation, secondaryAnimation, child){
                                  const begin = Offset(-1, 0);
                                  const end = Offset.zero;
                                  const curve = Curves.easeInOut;

                                  var tween = Tween(begin: begin,end: end).chain(CurveTween(curve: curve));
                                  var offSetAnimation = animation.drive(tween);

                                  return SlideTransition(position: offSetAnimation, child: child);
                                },
                                transitionDuration: Duration(milliseconds: 500)
                              )        
                            );
                          } ,
                          child: Icon(
                            Icons.arrow_back,
                            size: 30,   
                            color: Colors.white
                          ),
                        ),
                      ),
                      //centered image
                      Center(
                        child: Image.asset(
                          'assets/images/mdi_finance.png',
                          fit: BoxFit.contain,
                          height: 100,
                          width: 100,
                        ),
                      )
                    ],
                  ),
              ),
            ),

            //log in form
            Positioned(
              top: screenHeight * 0.35,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const Text(
                  "Email Address",

                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue
                  )
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: screenWidth - 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(color: Colors.grey, width: 1) // border color and width, when not active
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(color: Colors.blue, width: 2)
                      ),
                      // labelText: "email",
                      hintText: "example@gmail.com",
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      suffixIcon: Icon(Icons.email),
                      suffixIconColor: Colors.blue
                    ),
                  ),
                ),
                //password field
                const SizedBox(height: 30),
                const Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue
                  ),
                ),
                //text input for password
                const SizedBox(height: 10),
                SizedBox(
                  width: screenWidth - 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder( // creates the border for the text input
                        borderRadius: BorderRadius.circular(35)
                      ),
                      enabledBorder: OutlineInputBorder( // border style when not in focus
                        borderRadius: BorderRadius.circular(35),
                        borderSide:  BorderSide(color: Colors.grey, width: 1)
                      ),
                      focusedBorder: OutlineInputBorder( // border style when in focus
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide(color: Colors.blue, width: 2)
                      ),
                      hintText: "enter your password here",
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      suffixIcon: IconButton(
                        onPressed: () {
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
                //forgot password text
                const SizedBox(height: 10,),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end, // wrapped in row and used this alignment to place 
                    children: [
                      GestureDetector(
                        onTap: () {
                          // logic for forgot password
                        },
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            decoration: TextDecoration.underline
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //login button
                const SizedBox(height: 20),
                SizedBox(
                  width: screenWidth - 40,
                  child: ElevatedButton(
                    onPressed: () {
                      //logic for pressing login
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => BaseScreen())
                      );
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      elevation: 0
                    ),
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                      ),
                    )
                  ),
                ),
                const SizedBox(height: 20,),

                // lines along side OR text
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.blue,
                      )
                    ),
                    // padding between text and line on the right
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8)
                    ),
                    Text(
                      "OR",
                      style: TextStyle(color: Colors.blue, fontSize: 14),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6)
                    ),
                    Expanded(
                      child: Container(
                      height: 1,
                      color: Colors.blue,
                      )
                    )
                  ],
                ),
                //sign in with google button
                const SizedBox(height: 20,),
                SizedBox(
                  width: screenWidth - 40, // width of button
                  height: 50, // height of button
                  child: OutlinedButton(
                    onPressed: (){
                      //sign in with google logic
                    }, 
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blue, width: 2),
                      
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login in with Google",
                          style: TextStyle(color: Colors.blue, fontSize: 14),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12)
                        ),
                        Image.asset("assets/images/google.png",
                        )
                      ],
                    )
                  )
                )
              ],
              ),
            )
          ],
        )
      ),
    );
  }
}