part of 'character_list_bloc.dart';

@immutable
abstract class CharacterListEvent extends Equatable {
  const CharacterListEvent();
}

class RetrieveCharacterList extends CharacterListEvent {
  @override
  List<Object> get props => [];
}
