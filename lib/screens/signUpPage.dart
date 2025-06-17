import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/screens/onboardingScreen.dart';

class signUpScreen extends StatefulWidget{
  const signUpScreen({super.key});

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  bool isPasswordVisible = false;
  

  @override
  Widget build(BuildContext context) {
     final screenHeight = MediaQuery.of(context).size.height;
     final screenWidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      ), 
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            child: Stack(
              children: [
                //top blue background
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 420,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100)
                      )
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30),
                          //back arrow
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context, 
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) => OnboardingScreen(),
                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    const begin = Offset(-1, 0);
                                    const end = Offset.zero;
                                    const curve = Curves.easeInOut;
            
                                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                    var offSetAnimation = animation.drive(tween);
                                    
                                    return SlideTransition(position: offSetAnimation, child: child);
                                  } ,
                                  transitionDuration: Duration(milliseconds: 500)
                                )
                              );
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle // makes the container circular
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: Colors.blue,
                              ),
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
                  )
                ),
            
                //sign up form
                Positioned(
                  top: 250,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // first name text box
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start, // places the children 
                            children: [
                              const Text("First Name", style: TextStyle(fontSize: 14, color: Colors.blue, )),
                              SizedBox(height: 5,),
                              SizedBox(
                                width: 170,
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35),
                                      borderSide: BorderSide(color: Colors.grey, width: 1)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35),
                                      borderSide: BorderSide(color: Colors.blue, width: 2)
                                    ),
                                    hintText: "psam",
                                    hintStyle: TextStyle(color: Colors.grey[400]),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12)
                      
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // last name text box
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Last Name", style: TextStyle(fontSize: 14, color: Colors.blue),),
                              SizedBox(height: 5,),
                              SizedBox(
                                width: 170,
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35),
                                      borderSide: BorderSide(color: Colors.grey, width: 1)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35),
                                      borderSide: BorderSide(color: Colors.blue, width: 2)
                                    ),
                                    hintText: "sap",
                                    hintStyle: TextStyle(color: Colors.grey[400]),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
            
                      // email address field
                      const SizedBox(height: 20,),
                      Text("Email Address", style: TextStyle(fontSize: 14, color: Colors.blue),),
                      SizedBox(height: 5),
                      SizedBox(
                        width: screenWidth - 40,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Colors.blue)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Colors.grey, width: 1)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Colors.blue, width: 2)
                            ),
                            hintText: "example@gmail.com",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            suffixIcon: Icon(Icons.email),
                            suffixIconColor: Colors.blue
                          ),
                        ),
                      ),
            
                      const SizedBox(height: 20,),
                      Text("Phone", style: TextStyle(fontSize: 14, color: Colors.blue),),
                      SizedBox(height: 5),
                      SizedBox(
                        width: screenWidth - 40,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Colors.blue)
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Colors.grey, width: 1)
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide(color: Colors.blue, width: 2)
                            ),
                            hintText: "0212345678",
                            hintStyle: TextStyle(color: Colors.grey[400]),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            suffixIcon: Icon(Icons.phone),
                            suffixIconColor: Colors.blue
                          ),
                        ),
                      ),
            
                      //passwords fields
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Password", style: TextStyle(fontSize: 14, color: Colors.blue),),
                              SizedBox(height: 5,),
                              SizedBox(
                                width: 170,
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35),
                                      borderSide: BorderSide(color: Colors.grey, width: 1)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35),
                                      borderSide: BorderSide(color: Colors.blue, width: 2)
                                    ),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                                  
                                  ),
                                  obscureText: !isPasswordVisible,
                                ),
                              )
                            ],
                          ),

                          //confirm password field
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Confirm password", style: TextStyle(fontSize: 14, color: Colors.blue),),
                              SizedBox(height: 5,),
                              SizedBox(
                                width: 170,
                                height: 50,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35),
                                      borderSide: BorderSide(color: Colors.grey, width: 1)
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(35),
                                      borderSide: BorderSide(color: Colors.blue, width: 2)
                                    ),
                                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                                  
                                  ),
                                  obscureText: !isPasswordVisible,
                                ),
                              )
                            ],
                          )

                        ],
                      ),

                        const SizedBox(height: 50),
                        SizedBox(
                          width: screenWidth - 40,
                          child: ElevatedButton(
                            onPressed: () {
                              //logic for pressing login
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
                              "Sign up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                              ),
                            )
                          ),
                        ),

                        const SizedBox(height: 15,),

                        // lines along side OR text
                        Row(
                          children: [
                            Expanded(
                              child: Container(height: 1, color: Colors.blue,)
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
                              child: Container(height: 1,color: Colors.blue,)
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
                                  "Sign in with Google",
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
                    
                  )
                )
            
              ],
            ),
          ),
        ),
      ), 
    );
  }
}