import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:genshin_api/genshin_api.dart';
import 'package:genshinfo/features/character_filter/bloc/character_filter_bloc.dart';
import 'package:genshinfo/features/character_filter/widgets/filter_list.dart';
import 'package:genshinfo/features/character_list/bloc/character_list_bloc.dart';
import 'package:sizer/sizer.dart';

class CharacterFilterBottomSheet extends StatefulWidget {
  const CharacterFilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CharacterFilterBottomSheetState();
}

class CharacterFilterBottomSheetState
    extends State<CharacterFilterBottomSheet> {
  late CharacterFilterBloc bloc;

  @override
  void initState() {
    CharacterListBloc charListBloc =
        BlocProvider.of<CharacterListBloc>(context);
    bloc = CharacterFilterBloc(
        visions: charListBloc.state.visions,
        weaponTypes: charListBloc.state.weaponTypes,
        rarity: charListBloc.state.rarity);

    //cache images

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterFilterBloc, CharacterFilterState>(
        bloc: bloc,
        builder: (context, state) {
          if (state.status == CharacterFilterStatus.initial ||
              state.status == CharacterFilterStatus.success) {
            return SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Filter',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Vision',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FilterList(
                      selectedItems: state.visions,
                      callback: (item) =>
                          bloc.add(VisionSelected(vision: item as Vision)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Weapon',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FilterList(
                      selectedItems: state.weaponTypes,
                      callback: (item) => bloc.add(
                          WeaponTypeSelected(weaponType: item as WeaponType)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Rarity',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: RatingBar.builder(
                          initialRating: state.rarity.toDouble(),
                          minRating: 4,
                          maxRating: 5,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemSize: 25,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                          itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                          onRatingUpdate: (rarity) {
                            //unselect if tap again
                            if (rarity == state.rarity.toDouble()) {
                              bloc.add(const RaritySelected(rarity: 0));
                            } else {
                              bloc.add(RaritySelected(rarity: rarity.toInt()));
                            }
                          }),
                    ),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      width: 100.w,
                      child: ElevatedButton(
                          child: const Text('Filter'),
                          onPressed: () {
                            Navigator.pop(context);
                            BlocProvider.of<CharacterListBloc>(context).add(
                              RetrieveCharacterList(
                                  rarity: state.rarity,
                                  weaponTypes: state.weaponTypes,
                                  visions: state.visions),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              width: 100.w,
              height: 40.h,
            );
          }
          return SizedBox(
            child: Text(state.status.toString()),
          );
        });
  }
}
