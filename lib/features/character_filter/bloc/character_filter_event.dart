part of 'character_filter_bloc.dart';

abstract class CharacterFilterEvent extends Equatable {
  const CharacterFilterEvent();

  @override
  List<Object> get props => [];
}

class VisionSelected extends CharacterFilterEvent {
  final Vision vision;

  const VisionSelected({required this.vision});

  @override
  List<Object> get props => [vision];
}

class WeaponTypeSelected extends CharacterFilterEvent {
  final WeaponType weaponType;

  const WeaponTypeSelected({required this.weaponType});

  @override
  List<Object> get props => [weaponType];
}

class RaritySelected extends CharacterFilterEvent {
  final int rarity;

  const RaritySelected({required this.rarity});

  @override
  List<Object> get props => [rarity];
}
