// import 'package:genshinfo/features/character_list/protos/character.pbgrpc.dart';
// import 'package:genshinfo/services/grpc_client.dart';
// import 'package:grpc/grpc.dart';

import 'package:equatable/equatable.dart';

enum Vision { none, pyro, cryo, anemo, geo, electro, hydro, dendro }
enum Weapon { sword, bow, catalyst, claymore, polearm }

class Character {
  late int id;
  late String name;
  late int rarity;
  late Vision vision;
  late Weapon weapon;
  late String imageUrl;
  Character(
      {required this.name,
      required this.rarity,
      required this.vision,
      required this.weapon,
      required this.imageUrl,
      required this.id});

  static getCharacterListFromServer() {
    // ClientChannel channel = GrpcClient().client;
    // CharacterListServiceClient stub = CharacterListServiceClient(channel,
    //     options: CallOptions(timeout: const Duration(seconds: 30)));

    List<Character> characters = [];
    characters.add(Character(
        id: 1,
        name: "Tartaglia",
        vision: Vision.hydro,
        weapon: Weapon.bow,
        imageUrl: 'https://api.genshin.dev/characters/tartaglia/portrait',
        rarity: 5));
    characters.add(Character(
        id: 2,
        name: "Noelle",
        vision: Vision.geo,
        weapon: Weapon.claymore,
        imageUrl: 'https://api.genshin.dev/characters/noelle/portrait',
        rarity: 4));
    characters.add(Character(
        id: 3,
        name: "Diluc",
        vision: Vision.pyro,
        weapon: Weapon.claymore,
        imageUrl: 'https://api.genshin.dev/characters/diluc/portrait',
        rarity: 5));
    characters.add(Character(
        id: 4,
        name: "Jean",
        vision: Vision.anemo,
        weapon: Weapon.sword,
        imageUrl: 'https://api.genshin.dev/characters/jean/portrait',
        rarity: 5));

    return characters;
  }
}


