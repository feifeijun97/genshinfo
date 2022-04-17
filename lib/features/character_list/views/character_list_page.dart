import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:genshin_api/genshin_api.dart' hide Character;
import 'package:genshinfo/features/character_list/bloc/character_list_bloc.dart';
import 'package:genshinfo/features/character_list/models/character.dart';
import 'package:genshinfo/features/character_list/widgets/custom_app_bar.dart';
import 'package:genshinfo/features/character_list/widgets/character_card.dart';
import 'package:genshinfo/features/character_list/widgets/element_filter.dart';
import 'package:hexcolor/hexcolor.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CharacterListPageState();
}

class CharacterListPageState extends State<CharacterListPage> {
  CharacterListBloc bloc = CharacterListBloc(GenshinApiClient());

  @override
  void initState() {
    bloc.add(const RetrieveCharacterList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24 - 130) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: HexColor('#0f1923'),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Center(
          child: Image.asset(
            'images/logo/logo.png',
            height: 100,
          ),
        ),
        Row(
          children: const [ElementFilterList()],
        ),
        Expanded(
            flex: 6,
            child: BlocBuilder<CharacterListBloc, CharacterListState>(
              bloc: bloc,
              builder: (context, state) {
                if (state.status.isSuccess) {
                  return GridView.count(
                      crossAxisCount: 2,
                      scrollDirection: Axis.vertical,
                      childAspectRatio: (itemWidth / itemHeight),
                      children: [
                        for (Character c in state.characterList.characterList)
                          characterCard(
                              name: c.name,
                              vision: c.vision,
                              weapon: c.weapon,
                              rarity: c.rarity,
                              imageUrl: c.imageUrl)
                      ]);
                }
                return const SizedBox();
              },
            ))
      ]),
    );
  }
}
