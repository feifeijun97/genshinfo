import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:genshinfo/extensions/string_extension.dart';
import 'package:genshinfo/features/character_detail/widgets/constellation_list.dart';
import 'package:genshinfo/features/character_detail/widgets/passive_skill_list.dart';
import 'package:genshinfo/features/character_detail/widgets/skill_list.dart';
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
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: SingleChildScrollView(
          child: Stack(
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
                padding:
                    EdgeInsets.only(top: 40.h, left: 10, right: 10, bottom: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100.w,
                      height: 20.h,
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
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(),
                            ]),
                            tableSpacer(10),
                            TableRow(children: [
                              characterInfoCell(
                                context,
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
                                context,
                                'Vision',
                                Row(
                                  children: [
                                    Image(
                                        width: 20,
                                        height: 20,
                                        image: AssetImage(
                                            character.vision.getAssetPath())),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      character.vision.name.capitalize(),
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                            tableSpacer(10),
                            TableRow(children: [
                              characterInfoCell(
                                context,
                                'Weapon',
                                Row(
                                  children: [
                                    ImageIcon(AssetImage(
                                        character.weapon.getAssetPath())),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      character.weapon.name.capitalize(),
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              ),
                              characterInfoCell(
                                  context,
                                  'Birthday',
                                  Text(
                                    character.birthday ?? "-",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  )),
                            ]),
                          ],
                        ),
                      )),
                    ),
                    titleText('Introduction', context),
                    Text(character.description == ""
                        ? '-'
                        : character.description),
                    // Text(character.constellationName),
                    const SizedBox(height: 6.5),
                    Flexible(
                      child: ExpansionTile(
                          tilePadding: const EdgeInsets.all(0),
                          title: titleText('Skills', context),
                          children: [
                            SkillList(skills: character.talents),
                          ]),
                    ),
                    Flexible(
                      child: ExpansionTile(
                          tilePadding: const EdgeInsets.all(0),
                          title: titleText('Constellations', context),
                          children: [
                            ConstellationList(
                                constellations: character.constellations),
                          ]),
                    ),
                    Flexible(
                      child: ExpansionTile(
                          tilePadding: const EdgeInsets.all(0),
                          title: titleText('Passive', context),
                          children: [
                            PassiveSkillList(skills: character.passiveTalents),
                          ]),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
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

  Widget characterInfoCell(context, String title, Widget valueWidget) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(
          height: 3,
        ),
        valueWidget
      ],
    );
  }

  Widget titleText(String body, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        body,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
