import 'package:genshin_api/genshin_api.dart' hide Character;
import 'package:genshin_api/genshin_api.dart' as genshin_api;
import 'package:equatable/equatable.dart';

class Character extends Equatable {
  const Character(
      {required this.name,
      required this.vision,
      required this.weapon,
      required this.imageUrl,
      required this.rarity});

  // const Character({required this.name});

  @override
  List<Object?> get props => [name, vision, weapon, imageUrl, rarity];

  final String name;
  final Vision vision;
  final WeaponType weapon;
  final String imageUrl;
  final int rarity;

  factory Character.fromRepository(genshin_api.Character character) {
    return Character(
        name: character.name,
        vision: character.vision,
        weapon: character.weapon,
        imageUrl:
            "https://api.genshin.dev/characters/${character.name}/portrait",
        rarity: character.rarity);
  }

  Character copyWith(
      {String? name,
      Vision? vision,
      WeaponType? weapon,
      String? imageUrl,
      int? rarity}) {
    return Character(
        name: name ?? this.name,
        vision: vision ?? this.vision,
        weapon: weapon ?? this.weapon,
        imageUrl: imageUrl ?? this.imageUrl,
        rarity: rarity ?? this.rarity);
  }
}

class CharacterList extends Equatable {
  const CharacterList({required this.characterList});

  @override
  List<Object?> get props => [characterList];

  final List<Character> characterList;

  CharacterList copyWith({List<Character>? characterList}) {
    return CharacterList(
      characterList: characterList ?? this.characterList,
    );
  }

  factory CharacterList.fromRepository(
      List<genshin_api.Character> characterList) {
    return CharacterList(
        characterList: List<Character>.from(
            characterList.map((e) => Character.fromRepository(e))));
  }
}
