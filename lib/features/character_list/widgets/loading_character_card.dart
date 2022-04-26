import 'package:flutter/material.dart';
import 'package:genshinfo/features/character_list/widgets/clippers/character_background_clipper.dart';
import 'package:shimmer/shimmer.dart';

Widget loadingCharacterCard(Color color, Color highlightColor) {
  return Shimmer.fromColors(
      child: ClipPath(
        clipper: CharacterBackgroundClipper(),
        child: Container(
          alignment: Alignment.bottomCenter,
          width: 150,
          height: 260,
          decoration: BoxDecoration(color: color
              // gradient: LinearGradient(
              //     begin: Alignment.bottomLeft,
              //     end: Alignment.topRight,
              //     colors: [color, color]),
              ),
        ),
      ),
      baseColor: color,
      highlightColor: highlightColor);
}
