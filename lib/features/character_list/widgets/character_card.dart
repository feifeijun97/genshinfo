import 'package:flutter/material.dart';
import 'package:genshinfo/features/character_list/models/character.dart';
import 'package:hexcolor/hexcolor.dart';

import 'clippers/character_background_clipper.dart';
import 'clippers/character_image_clipper.dart';

Widget characterCard(
    {required String name,
    required Vision vision,
    required Weapon weapon,
    required int rarity,
    required int id,
    required String imageUrl}) {
  return SizedBox(
      width: 150,
      height: 250,
      child: Stack(
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
            child: Image.network(
              imageUrl,
              width: 180,
              height: 260,
              fit: BoxFit.cover,
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
      ));
}

List<HexColor> getVisionHexColor(Vision vision) {
  switch (vision) {
    case Vision.pyro:
      return [
        HexColor('#E46F0D'),
        HexColor('#F9A661'),
      ];
    case Vision.cryo:
      // TODO: Handle this case.
      break;
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
      // TODO: Handle this case.
      break;
    case Vision.hydro:
      return [
        HexColor('#07519D'),
        HexColor('#459CF5'),
      ];
    case Vision.dendro:
      // TODO: Handle this case.
      break;
    case Vision.none:
      // TODO: Handle this case.
      break;
  }

  return [
    HexColor('#9a6604'),
    HexColor('#ffd589'),
  ];
}

HexColor getVisionTextColor(Vision vision) {
  switch (vision) {
    case Vision.none:
      // TODO: Handle this case.
      break;
    case Vision.pyro:
      return HexColor('#fe925d');
    case Vision.cryo:
      // TODO: Handle this case.
      break;
    case Vision.anemo:
      return HexColor('#72e2c3');
    case Vision.geo:
      return HexColor('#e3b342');
    case Vision.electro:
      // TODO: Handle this case.
      break;
    case Vision.hydro:
      return HexColor('#21e1eb');
    case Vision.dendro:
      // TODO: Handle this case.
      break;
  }
  return HexColor("FFFFFF");
}
