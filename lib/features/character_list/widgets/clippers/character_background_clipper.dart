import 'package:flutter/material.dart';

/// Character Card Background Clip Path
class CharacterBackgroundClipper extends CustomClipper<Path> {
  double radius = 70;
  double smallRadius = 20;

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(smallRadius,
          smallRadius / 2) //move the cursor from TL to right abit (10 pixel)
      ..lineTo(
          size.width - radius,
          smallRadius +
              5) //straight line from starting cursor to TR (0, y - n) where n is a
      ..arcToPoint(Offset(size.width, radius + (radius / 2)),
          radius: Radius.circular(radius + smallRadius - 5))
      // ..lineTo(0, size.height) // Add line p1p2
      ..lineTo(size.width, size.height) // Add line p2p3
      ..lineTo(radius, size.height) // Add line p2p3
      ..arcToPoint(Offset(0, size.height - radius),
          radius: Radius.circular(radius))
      ..lineTo(0, smallRadius + 10)
      ..arcToPoint(Offset(smallRadius, smallRadius / 2),
          radius: Radius.circular(smallRadius))
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
