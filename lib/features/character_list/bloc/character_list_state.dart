part of 'character_list_bloc.dart';

enum CharacterListStatus { initial, loading, success, failure }

extension CharacterListStatusX on CharacterListStatus {
  bool get isInitial => this == CharacterListStatus.initial;
  bool get isLoading => this == CharacterListStatus.loading;
  bool get isSuccess => this == CharacterListStatus.success;
  bool get isFailure => this == CharacterListStatus.failure;
}

class CharacterListState extends Equatable {
  CharacterListState({
    this.status = CharacterListStatus.initial,
    CharacterList? characterList,
    this.visions,
    this.rarity,
    this.name,
    this.weaponTypes,
  }) : characterList = characterList ??
            CharacterList(
              characterList: List<Character>.empty(),
            );

  final CharacterListStatus status;
  final CharacterList characterList;
  final List<Vision>? visions;
  final int? rarity;
  final String? name;
  final List<WeaponType>? weaponTypes;

  CharacterListState copyWith({
    CharacterListStatus? status,
    CharacterList? characterList,
    List<Vision>? visions,
    int? rarity,
    String? name,
    List<WeaponType>? weaponTypes,
  }) {
    return CharacterListState(
      status: status ?? this.status,
      characterList: characterList ?? this.characterList,
      visions: visions ?? this.visions,
      rarity: rarity ?? this.rarity,
      weaponTypes: weaponTypes ?? this.weaponTypes,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props =>
      [status, characterList, visions, rarity, name, weaponTypes];
}
