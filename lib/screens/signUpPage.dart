import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/screens/basePage.dart';

class SignUpScreen extends StatefulWidget{
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // boolean to control password visibility
  bool isPasswordVisible = false;

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
          
          
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 170,
                        height: 50,
                        child: TextField(
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
                      SizedBox(
                        width: 170,
                        height: 50,
                        child: TextField(
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

                SizedBox(height: 30,),
                //
                SizedBox(
                  width: screenWidth * 0.7,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => BaseScreen())
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue
                    ),
                    child: Text("Sign up", style: TextStyle(color: Colors.white, fontSize: 16), ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
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

              ],
            ),
          ),
        ),
      ),
    );
  }
}