part of 'character_list_bloc.dart';

@immutable
abstract class CharacterListEvent extends Equatable {
  const CharacterListEvent();
}

class RetrieveCharacterList extends CharacterListEvent {
  final List<Vision> visions;
  final int rarity;
  final String name;
  final List<WeaponType> weaponTypes;

  const RetrieveCharacterList(
      {this.rarity = 0,
      this.name = "",
      this.weaponTypes = const [],
      this.visions = const []});
  @override
  List<Object> get props => [rarity, name, weaponTypes, visions];
}
