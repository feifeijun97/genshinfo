part of 'character_list_bloc.dart';

@immutable
abstract class CharacterListEvent extends Equatable {
  const CharacterListEvent();
}

class RetrieveCharacterList extends CharacterListEvent {
  
  final Vision? vision;
  final int? rarity;
  final String? name;
  final Weapon? weaponType;

  const RetrieveCharacterList({this.rarity, this.name, this.weaponType, this.vision});
  @override
  List<Object> get props => [];
}
