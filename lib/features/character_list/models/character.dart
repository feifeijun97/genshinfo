import 'package:genshin_api/genshin_api.dart' hide Character;
import 'package:genshin_api/genshin_api.dart' as genshin_api;
import 'package:equatable/equatable.dart';

class Character extends Equatable {
  const Character(
      {required this.name,
      required this.vision,
      required this.weapon,
      required this.imageUrl,
      required this.rarity,
      required this.detailImageUrl,
      required this.affiliation,
      required this.constellationName,
      this.birthday,
      required this.description,
      required this.talents,
      required this.passiveTalents,
      required this.constellations});

  // const Character({required this.name});

  @override
  List<Object?> get props =>
      [name, vision, weapon, imageUrl, rarity, detailImageUrl];

  final String name;
  final Vision vision;
  final WeaponType weapon;
  final String imageUrl;
  final String detailImageUrl;
  final int rarity;
  final String affiliation;
  final String constellationName;
  final String? birthday;
  final String description;
  final List<Talent> talents;
  final List<Talent> passiveTalents;
  final List<Constellation> constellations;

  factory Character.fromRepository(genshin_api.Character character) {
    //get firt name of the character if full name returned
    //some character return full name, but url only support first name
    String characterName = modifyName(character.name);

    return Character(
      name: character.name,
      vision: character.vision,
      weapon: character.weapon,
      imageUrl: "https://api.genshin.dev/characters/$characterName/portrait",
      detailImageUrl: "https://api.genshin.dev/characters/$characterName/card",
      birthday: character.birthday,
      rarity: character.rarity,
      affiliation: character.affiliation,
      constellationName: character.constellationName,
      talents: character.talents,
      constellations: character.constellations,
      description: character.description,
      passiveTalents: character.passiveTalents,
    );
  }

  Character copyWith({
    String? name,
    Vision? vision,
    WeaponType? weapon,
    String? imageUrl,
    String? detailImageUrl,
    String? birthday,
    int? rarity,
    String? affiliation,
    String? constellationName,
    String? description,
    List<Talent>? talents,
    List<Talent>? passiveTalents,
    List<Constellation>? constellations,
  }) {
    return Character(
      name: name ?? this.name,
      vision: vision ?? this.vision,
      weapon: weapon ?? this.weapon,
      imageUrl: imageUrl ?? this.imageUrl,
      detailImageUrl: detailImageUrl ?? this.detailImageUrl,
      rarity: rarity ?? this.rarity,
      affiliation: affiliation ?? this.affiliation,
      constellationName: constellationName ?? this.constellationName,
      constellations: constellations ?? this.constellations,
      description: description ?? this.description,
      passiveTalents: passiveTalents ?? this.passiveTalents,
      talents: talents ?? this.talents,
      birthday: birthday ?? this.birthday,
    );
  }

  /// Change the returned name to url-suitable name
  static String modifyName(String name) {
    List<String> takeLastNameList = [
      'Kamisato Ayaka',
      'Sangonomiya Kokomi',
      'Kujou Sara',
      'Kaedehara Kazuha'
    ];
    List<String> takeFirstNameList = ['Raiden Shogun'];
    List<String> addDashList = [
      'Arataki Itto',
      'Hu Tao',
      'Yun Jin',
      'Yae Miko'
    ];
    String traveler = "Traveler";
    String finalName = "";
    if (name == traveler) {
      finalName = "Traveler-Anemo";
    } else if (takeFirstNameList.contains(name)) {
      var splittedName = name.split(' ');
      finalName = splittedName[0];
    } else if (takeLastNameList.contains(name)) {
      var splittedName = name.split(' ');
      finalName = splittedName[1];
    } else if (addDashList.contains(name)) {
      finalName = name.replaceAll(' ', '-');
    } else {
      finalName = name;
    }

    return finalName.toLowerCase();
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
