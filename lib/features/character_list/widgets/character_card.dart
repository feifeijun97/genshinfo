import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:genshin_api/genshin_api.dart' hide Character;
import 'package:genshinfo/extensions/vision_extension.dart';

import 'clippers/character_background_clipper.dart';
import 'clippers/character_image_clipper.dart';

Widget characterCard(
    {required String name,
    required Vision vision,
    required WeaponType weapon,
    required int rarity,
    required String imageUrl}) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: <Widget>[
      ClipPath(
        clipper: CharacterBackgroundClipper(),
        child: Container(
          alignment: Alignment.bottomCenter,
          width: 180,
          height: 250,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: vision.getVisionHexColor()),
          ),
        ),
      ),
      ClipPath(
        clipper: CharacterImageClipper(),
        child: Center(
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: 180,
            height: 260,
            fit: BoxFit.fitHeight,
            errorWidget: (context, url, stack) => const SizedBox(),
          ),
        ),
      ),
      Container(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40, left: 20),
          child: Text(
            name,
            style: TextStyle(
              // inherit: true,
              fontSize: 35.0,
              fontWeight: FontWeight.w400,
              color: vision.getVisionTextColor(),
              shadows: const [
                Shadow(
                    // bottomLeft
                    offset: Offset(-1, -1),
                    color: Colors.white),
                Shadow(
                    // bottomRight
                    offset: Offset(1, -1),
                    color: Colors.white),
                Shadow(
                    // topRight
                    offset: Offset(1, 1),
                    color: Colors.white),
                Shadow(
                    // topLeft
                    offset: Offset(-1, 1),
                    color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
