import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:genshin_api/genshin_api.dart' hide Character;
import 'package:genshinfo/features/character_list/models/character.dart';
import 'package:meta/meta.dart';

part 'character_list_event.dart';
part 'character_list_state.dart';

class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  final GenshinApiClient _genshinApiClient;

  CharacterListBloc(this._genshinApiClient) : super(CharacterListState()) {
    on<RetrieveCharacterList>(_onRetrieveCharacterList);
  }

  FutureOr<void> _onRetrieveCharacterList(
      RetrieveCharacterList event, Emitter<CharacterListState> emit) async {
    emit(state.copyWith(status: CharacterListStatus.loading));

    CharacterList characterList = CharacterList.fromRepository(
        await _genshinApiClient.getAllCharacters());

    if (event.visions.isNotEmpty ||
        event.weaponTypes.isNotEmpty ||
        event.rarity > 0 ||
        event.name.isNotEmpty) {
      // ignore: prefer_const_constructors, prefer_const_literals_to_create_immutables
      CharacterList filteredCharacterList = CharacterList(characterList: []);
      for (var c in characterList.characterList) {
        // skip the character if does not match any of the following filter requirement
        if (event.visions.isNotEmpty && !event.visions.contains(c.vision)) {
          continue;
        }
        if (event.weaponTypes.isNotEmpty &&
            !event.weaponTypes.contains(c.weapon)) {
          continue;
        }
        if (event.rarity > 0 && event.rarity != c.rarity) {
          continue;
        }
        if (event.name.isNotEmpty &&
            !event.name.toLowerCase().contains(c.name.toLowerCase())) {
          continue;
        }
        //add into list after all
        filteredCharacterList.characterList.add(c);
      }

      characterList = filteredCharacterList;
    }

    return emit(state.copyWith(
      status: CharacterListStatus.success,
      characterList: characterList,
      visions: event.visions,
      weaponTypes: event.weaponTypes,
      rarity: event.rarity,
      name: event.name,
    ));
  }
}
