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

    return emit(state.copyWith(
      status: CharacterListStatus.success,
      characterList: characterList,
    ));
  }
}
