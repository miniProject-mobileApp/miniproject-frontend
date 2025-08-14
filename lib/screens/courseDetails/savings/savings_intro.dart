import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/screens/courseDetails/savings/Lessons/savings_lesson_one.dart';
import 'package:frontend/screens/courseDetails/savings/Lessons/savings_lesson_three.dart';
import 'package:frontend/screens/courseDetails/savings/Lessons/savings_lesson_two.dart';

class SavingsIntro extends StatelessWidget{
  const SavingsIntro({super.key});


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("More on Investment", style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.blue, ),
      ),
      body: SafeArea(
        child: Column(
          children: [ 
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 90),
              child: Row(
                children: [
                  Text("Created by tutor-one", style: TextStyle(fontSize: 18))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 90),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.amberAccent,),
                  SizedBox(width: 10,),
                  Text("8.7"),
                  SizedBox(width: 10,),
                  Text("|"),
                  SizedBox(width: 10,),
                  Text("102k subscribers")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              child: Container(
                width: screenWidth * 0.9,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  child: Image.asset('assets/images/image.png', fit: BoxFit.cover),
                ),
              ),
            ),
        
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Course content", style: TextStyle(fontSize: 20),),
                  Container(
                    width: 150,
                    height: 45,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.blue),
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(15)
        
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FaIcon(FontAwesomeIcons.clock),
                        Text("2hrs:10mins")
                      ],
                    )
                  )
                ],
              ),
            ),
        
            //scrollable
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Container(
                width: screenWidth * 0.9,
                height: 250,
                decoration: BoxDecoration(
                  border: BoxBorder.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    SizedBox(height: 10,),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Future.delayed(Duration(milliseconds: 200), () {
                            Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => SavingsLessonOne())
                            );
                          });
                          
                        },
                        splashColor: const Color.fromARGB(255, 159, 206, 245),
                        borderRadius: BorderRadius.circular(15),
                        child: Ink(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              FaIcon(FontAwesomeIcons.rectangleList, size: 25,),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Principles of Investing", style: TextStyle(fontSize: 16),),
                                  Text("Start with the fundamentals", style: TextStyle(fontSize: 12, color: Colors.grey), ),
                                ],
                              ),
                              SizedBox(width: 20,),
                              Icon(Icons.arrow_forward_ios_outlined)
                            ],
                          ),
                        ),
                      ),
                    ),
                    // vertical line
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(color: Colors.grey, width: 2),
                          )
                        ),
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                           Future.delayed(Duration(milliseconds: 200), () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => SavingsLessonTwo())
                            );
                          });
                        },
                        splashColor: const Color.fromARGB(255, 159, 206, 245),
                        borderRadius: BorderRadius.circular(15),
                        child: Ink(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.transparent
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 18,),
                              FaIcon(FontAwesomeIcons.rectangleList, size: 25,),
                              SizedBox(width: 60),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Compound Interest", style: TextStyle(fontSize: 16),),
                                  Text("Continue savings basics ", style: TextStyle(fontSize: 12, color: Colors.grey), ),
                                ],
                              ),
                              SizedBox(width: 64),
                              Icon(Icons.arrow_forward_ios_outlined)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(color: Colors.grey, width: 2),
                          )
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Future.delayed(Duration(milliseconds: 200), () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (context) => SavingsLessonThree())
                            );
                        });
                      },
                      splashColor: const Color.fromARGB(255, 159, 206, 245),
                      borderRadius: BorderRadius.circular(15),
                      child: Ink(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            SizedBox(width: 18,),
                            FaIcon(FontAwesomeIcons.rectangleList, size: 25,),
                            SizedBox(width: 60),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Finance Management", style: TextStyle(fontSize: 16),),
                                Text("Delve into lesson three ", style: TextStyle(fontSize: 12, color: Colors.grey), ),
                              ],
                            ),
                            SizedBox(width: 45),
                            Icon(Icons.arrow_forward_ios_outlined)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}