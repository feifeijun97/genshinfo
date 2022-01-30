import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:genshinfo/features/character_list/models/character.dart';
import 'package:meta/meta.dart';

part 'character_list_event.dart';
part 'character_list_state.dart';

class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  CharacterListBloc() : super(CharacterListInitial()) {
    // on<CharacterListEvent>((event, emit) {
    //   CharacterList.getCharacterListFromServer();
    // });
    on<RetrieveCharacterList>(_onRetrieveCharacterList);
  }

  FutureOr<void> _onRetrieveCharacterList(RetrieveCharacterList event, Emitter<CharacterListState> emit) async {
      var characterList = Character.getCharacterListFromServer();
      return emit(CharacterListResult(status: ListStatus.success, lists: characterList, hasReachedMax: true));
  }
}
