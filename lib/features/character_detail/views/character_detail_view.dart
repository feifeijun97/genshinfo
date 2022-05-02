import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:genshinfo/features/character_filter/models/weapon_type_extension.dart';
import 'package:genshinfo/features/character_list/models/character.dart';
import 'package:sizer/sizer.dart';
import 'package:genshinfo/features/character_filter/models/vision_extension.dart';

class CharacterDetailPage extends StatelessWidget {
  final Character character;
  const CharacterDetailPage({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FittedBox(
          fit: BoxFit.fill,
          child: CachedNetworkImage(
            imageUrl: character.detailImageUrl,
            width: 100.w,
            height: 45.h,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40.h, bottom: 10, left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(
                width: 100.w,
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(
                    columnWidths: {
                      0: FlexColumnWidth(50.w),
                      1: FlexColumnWidth(50.w),
                    },
                    children: [
                      TableRow(children: [
                        Text(
                          character.name,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        const SizedBox(),
                      ]),
                      tableSpacer(10),
                      TableRow(children: [
                        characterInfoCell(
                          'Rarity',
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              for (int i = 0; i < character.rarity; i++)
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                            ],
                          ),
                        ),
                        characterInfoCell(
                          'Vision',
                          Row(
                            children: [
                              ImageIcon(
                                  AssetImage(character.vision.getAssetPath())),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(character.vision.name),
                            ],
                          ),
                        ),
                      ]),
                      tableSpacer(10),
                      TableRow(children: [
                        characterInfoCell(
                          'Weapon',
                          Row(
                            children: [
                              ImageIcon(
                                  AssetImage(character.weapon.getAssetPath())),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(character.weapon.name),
                            ],
                          ),
                        ),
                        characterInfoCell('Birthday', Text(character.name)),
                      ]),
                    ],
                  ),
                )),
              )
            ],
          ),
        )
      ],
    );
  }

  TableRow tableSpacer(double height) {
    return TableRow(
      children: [
        SizedBox(
          height: height,
        ),
        SizedBox(
          height: height,
        )
      ],
    );
  }

  Widget characterInfoCell(String title, Widget valueWidget) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(title), valueWidget],
    );
  }
}
