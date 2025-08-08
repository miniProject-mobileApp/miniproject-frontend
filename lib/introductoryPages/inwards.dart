import 'package:flutter/material.dart';
import 'package:frontend/utils/curvyClipper.dart';

class ShapeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Matching the background color from the image
      body: Center(
        child: ClipPath(
          clipper: QuarterArcClipper(),
          child: Container(
            width: 200, // Adjust size as needed
            height: 200, // Adjust size as needed
            color: Colors.blue, // Matching the blue color from the image
            child: Center(
              child: Icon(
                Icons.circle, // Placeholder icon, replace with your design if needed
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}