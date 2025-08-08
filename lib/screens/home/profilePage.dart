import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.blue[300],
        leading: Icon(Icons.arrow_back),
      ),
      body: GestureDetector(
        //unfocus the textfield when tapped outside
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //profile picture
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        //profile pic 
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: Colors.white),
                            color: Colors.grey[350]
                          ),
                        ),
          
                        //blue background
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue
                          ),
                          child: Center(child: FaIcon(FontAwesomeIcons.penToSquare, color: Colors.white, size: 15)),
                        )
                      ]
                    ),
                  ],
                ),
              ),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text("${authProvider.userName}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue), ),
                  ),
                ],
              ),
          
              // text fields
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth * 0.77,
                      //height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.blue.shade200),
                        borderRadius: BorderRadius.circular(18)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Full name", style: TextStyle(color: Colors.blue.shade200),),
                            Text("${authProvider.userName} ${authProvider.lastName}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),)
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 40,),

                    Container(
                      width: screenWidth * 0.77,
                      //height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.blue.shade200),
                        borderRadius: BorderRadius.circular(18)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("phone", style: TextStyle(color: Colors.blue.shade200),),
                            Text("${authProvider.phoneNumber}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),)
                          ],
                        ),
                      ),
                    ),

                    //phone
                    SizedBox(height: 40,),

                    Container(
                      width: screenWidth * 0.77,
                      //height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.blue.shade200),
                        borderRadius: BorderRadius.circular(18)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("email", style: TextStyle(color: Colors.blue.shade200),),
                            Text("${authProvider.email}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // // security
              // Row(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 16),
              //       child: Text("Security", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 18),),
              //     )
              //   ],
              // ),

              // SizedBox(height: 30,),

              // // change password
              // Container(
              //   width: 350,
              //   height: 50,
              //   decoration: BoxDecoration(
              //     border: Border.all(width: 1, color: Colors.blue),
              //     borderRadius: BorderRadius.circular(12),
              //     color: const Color.fromARGB(255, 225, 237, 247)
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 16),
              //         child: Text("Change you password", style: TextStyle(color: Colors.blue),),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(right: 20),
              //         child: Icon(Icons.arrow_forward_ios, size: 20,),
              //       )
              //     ],
              //   )
              // ),

              // SizedBox(height: 30,),

          
            ],
          ),
        ),
      )
    );
  }
}