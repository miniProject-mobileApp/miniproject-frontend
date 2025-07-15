import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/screens/home/homePage.dart';
import 'package:frontend/screens/home/lessonPage.dart';
import 'package:frontend/screens/home/newsPage.dart';
import 'package:frontend/screens/home/profilePage.dart';
import 'package:frontend/screens/home/statsPage.dart';

class BaseScreen extends StatefulWidget{
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _currentIndex = 0;

  // list of screens
  final List<Widget> _screens = [
    HomeScreen(),
    LessonScreen(),
    NewsScreen(),
    StatsScreen(),
    ProfileScreen()
  ];



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.blue, width: 1)
          )
        ),
        child: BottomNavigationBar(
          
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.personChalkboard), label: "Lessons"),
            BottomNavigationBarItem(icon: Icon(Icons.public), label: "News"),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Stats"),
            BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.circleUser), label: "Profile"),
          ]),
      ),
    );
  }
}