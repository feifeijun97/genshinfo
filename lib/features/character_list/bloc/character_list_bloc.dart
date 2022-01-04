import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:genshinfo/features/character_list/models/character_list.dart';
import 'package:meta/meta.dart';

part 'character_list_event.dart';
part 'character_list_state.dart';

class CharacterListBloc extends Bloc<CharacterListEvent, CharacterListState> {
  CharacterListBloc() : super(CharacterListInitial()) {
    on<CharacterListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
