import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget{
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    child: Text("Personal information",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue), ),
                  ),
                ],
              ),
          
              // text fields
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 350,
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          // filled: true, // this works with the fillColor to set the background color for the text input
                          // fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.blue)
                          ),
                          labelText: "Username",
                          labelStyle: TextStyle(color: Colors.blue)
                        ),
                        
                      ),
                    ),
          
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 350,
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.blue)
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.blue, width: 1)
                                ),
                                labelText: "Email",
                                labelStyle: TextStyle(color: Colors.blue)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    //phone
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 350,
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.blue)
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.blue, width: 1)
                                ),
                                labelText: "Mobile phone",
                                labelStyle: TextStyle(color: Colors.blue)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // security
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Security", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 18),),
                  )
                ],
              ),

              SizedBox(height: 30,),

              // change password
              Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.blue),
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(255, 225, 237, 247)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text("Change you password", style: TextStyle(color: Colors.blue),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(Icons.arrow_forward_ios, size: 20,),
                    )
                  ],
                )
              ),

              SizedBox(height: 30,),

          
            ],
          ),
        ),
      )
    );
  }
}