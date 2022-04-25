part of 'character_filter_bloc.dart';

enum CharacterFilterStatus { initial, loading, success, failure }

class CharacterFilterState extends Equatable {
  const CharacterFilterState({
    this.status = CharacterFilterStatus.initial,
    required this.visions,
    required this.weaponTypes,
    required this.rarity,
  });

  final List<Vision> visions;
  final List<WeaponType> weaponTypes;
  final int rarity;
  final CharacterFilterStatus status;

  CharacterFilterState copyWith(
      {CharacterFilterStatus? status,
      int? rarity,
      List<Vision>? visions,
      List<WeaponType>? weaponTypes}) {
    return CharacterFilterState(
        rarity: rarity ?? this.rarity,
        visions: visions ?? this.visions,
        weaponTypes: weaponTypes ?? this.weaponTypes,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [status, visions, weaponTypes];
}
