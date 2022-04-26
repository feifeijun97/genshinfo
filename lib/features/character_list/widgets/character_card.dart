import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:genshin_api/genshin_api.dart' hide Character;
import 'package:hexcolor/hexcolor.dart';

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
                colors: getVisionHexColor(vision)),
          ),
        ),
      ),
      ClipPath(
        clipper: CharacterImageClipper(),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: 180,
          height: 260,
          fit: BoxFit.fitHeight,
        ),
      ),
      Container(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40, left: 20),
          child: Text(
            name,
            style: TextStyle(
              inherit: true,
              fontSize: 30.0,
              color: getVisionTextColor(vision),
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

List<HexColor> getVisionHexColor(Vision vision) {
  switch (vision) {
    case Vision.pyro:
      return [
        HexColor('#E46F0D'),
        HexColor('#F9A661'),
      ];
    case Vision.cryo:
      return [
        HexColor('#448DC7'),
        HexColor('#77B8EB'),
      ];
    case Vision.anemo:
      return [
        HexColor('#019E8A'),
        HexColor('#48FFE8'),
      ];
    case Vision.geo:
      return [
        HexColor('#9a6604'),
        HexColor('#ffd589'),
      ];
    case Vision.electro:
      return [
        HexColor('#61459c'),
        HexColor('#7b5db7'),
      ];
    case Vision.hydro:
      return [
        HexColor('#07519D'),
        HexColor('#459CF5'),
      ];
    case Vision.dendro:
      return [
        HexColor('#04862A'),
        HexColor('#00BC37'),
      ];
  }
}

HexColor getVisionTextColor(Vision vision) {
  switch (vision) {
    case Vision.pyro:
      return HexColor('#fe925d');
    case Vision.cryo:
      return HexColor("3b83bd");
    case Vision.anemo:
      return HexColor('#72e2c3');
    case Vision.geo:
      return HexColor('#e3b342');
    case Vision.electro:
      return HexColor('#A754DC');
    case Vision.hydro:
      return HexColor('#21e1eb');
    case Vision.dendro:
      return HexColor('#2FD340');
  }
}
