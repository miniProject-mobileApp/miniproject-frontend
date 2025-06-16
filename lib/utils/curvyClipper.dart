import 'package:flutter/material.dart';

// Custom Clipper for the Quarter Arc Shape
class QuarterArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0); // Start at top-left
    path.lineTo(0, size.height); // Move to bottom-left
    path.quadraticBezierTo(
      size.width / 2, size.height / 2, // Control point for the curve
      size.width, 0, // End point at top-right
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}