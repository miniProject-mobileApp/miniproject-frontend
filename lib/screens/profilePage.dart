import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue
            ),
            child: Center(child: Text("Profile page", textAlign: TextAlign.center ,style: TextStyle(fontSize: 24, ), )),
          ),
        ),
      );
  }
}