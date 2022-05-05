import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:genshinfo/features/character_list/bloc/character_list_bloc.dart';
import 'package:genshinfo/features/character_list/widgets/custom_app_bar.dart';
import 'package:genshinfo/features/character_list/widgets/character_card.dart';
import 'package:genshinfo/features/character_list/widgets/loading_character_card.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/fluro_application.dart';
import 'package:genshin_api/genshin_api.dart' show Vision, WeaponType;
import 'package:genshinfo/features/character_filter/models/vision_extension.dart';
import 'package:genshinfo/features/character_filter/models/weapon_type_extension.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CharacterListPageState();
}

class CharacterListPageState extends State<CharacterListPage> {
  late CharacterListBloc bloc;
  List<Image> imgList = <Image>[];

  @override
  void initState() {
    bloc = BlocProvider.of<CharacterListBloc>(context);
    bloc.add(const RetrieveCharacterList());
    super.initState();
    //precache all images in filter bottom sheet
    for (var e in Vision.values) {
      imgList.add(Image.asset(e.getAssetPath()));
    }

    for (var e in WeaponType.values) {
      imgList.add(Image.asset(e.getAssetPath()));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (Image img in imgList) {
      precacheImage(img.image, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24 - 130) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: const CustomAppBar(),
      // backgroundColor: HexColor('#0f1923'),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Center(
          child: Image.asset(
            'images/logo/logo.png',
            height: 15.w,
          ),
        ),
        // Row(
        //   children: const [ElementFilterList()],
        // ),
        Expanded(
          flex: 6,
          child: BlocBuilder<CharacterListBloc, CharacterListState>(
            bloc: bloc,
            builder: (context, state) {
              if (state.status.isSuccess) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                      crossAxisCount: 2,
                      scrollDirection: Axis.vertical,
                      childAspectRatio: (itemWidth / itemHeight),
                      children: [
                        for (int i = 0;
                            i < state.characterList.characterList.length;
                            i++)
                          GestureDetector(
                            onTap: () => FluroApplication.router.navigateTo(
                              context,
                              'character_detail',
                              routeSettings: RouteSettings(
                                arguments: state.characterList.characterList[i],
                              ),
                            ),
                            child: characterCard(
                                name: state.characterList.characterList[i].name,
                                vision:
                                    state.characterList.characterList[i].vision,
                                weapon:
                                    state.characterList.characterList[i].weapon,
                                rarity:
                                    state.characterList.characterList[i].rarity,
                                imageUrl: state
                                    .characterList.characterList[i].imageUrl),
                          ),
                      ]),
                );
              } else if (state.status.isLoading) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      scrollDirection: Axis.vertical,
                      childAspectRatio: (itemWidth / itemHeight),
                      children: [
                        for (int i = 0; i < 4; i++)
                          loadingCharacterCard(
                              Theme.of(context).colorScheme.primary,
                              Theme.of(context).highlightColor)
                      ]),
                );
              }
              return const SizedBox();
            },
          ),
        )
      ]),
    );
  }
}
