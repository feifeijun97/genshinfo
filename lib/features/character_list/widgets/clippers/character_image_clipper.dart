import 'package:flutter/material.dart';

//Character Image Clipper, that is stack upper of characterBackgroundClipper.dart
class CharacterImageClipper extends CustomClipper<Path> {
  double radius = 70;

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width, 0) //straight line from TL to TR
      ..lineTo(size.width, size.height) //straight line from TR to BR
      ..lineTo(radius, size.height) // straight line from BR to (BL - radius)
      ..arcToPoint(Offset(0, size.height - radius),
          radius: Radius.circular(radius)) //draw a curve at BL
      ..lineTo(0, 0) // straight line from end point of curve to TL
      ..close(); //end
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
