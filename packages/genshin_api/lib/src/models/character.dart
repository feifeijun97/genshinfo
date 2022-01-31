import 'package:json_annotation/json_annotation.dart';
import 'enum.dart';

part 'character.g.dart';

enum Vision { none, pyro, cryo, anemo, geo, electro, hydro, dendro, unknown }
enum TalentType { normalAttack, elementSkill, elementBurst, unknown }

@JsonSerializable()
class Talent {
  final String name;
  @JsonKey(includeIfNull: true)
  final String unlock;
  final String description;
  @JsonKey(fromJson: _talentTypeFromJson, includeIfNull: true)
  final TalentType type;
  @JsonKey(includeIfNull: true)
  final int level;

  Talent(this.name, this.unlock, this.description, this.type, this.level);

  factory Talent.fromJson(Map<String, dynamic> json ) => _$TalentFromJson(json);

  // const Talent(
  //     {required this.name,
  //     required this.unlock,
  //     required this.description,
  //     required this.type,
  //     required this.level});

  static TalentType _talentTypeFromJson(String talentType) {
    switch (talentType) {
      case "ELEMENTAL_BURST":
        return TalentType.elementBurst;
      case "ELEMENTAL_SKILL":
        return TalentType.elementSkill;
      case "NORMAL_ATTACK":
        return TalentType.normalAttack;
      default:
        return TalentType.unknown;
    }
  }

}

@JsonSerializable()
class Constellation {
  final String name;
  final String unlock;
  final String description;
  final int level;

  Constellation(this.name, this.unlock, this.description, this.level);

  factory Constellation.fromJson(Map<String, dynamic> json ) => _$ConstellationFromJson(json);
  // const Constellation(
  //     {required this.name,
  //     required this.unlock,
  //     required this.description,
  //     required this.level});
}

@JsonSerializable()
class Character {
  final String name;
  @JsonKey(fromJson: _visionFromJson)
  final Vision vision;
  @JsonKey(fromJson: _weaponFromJson, toJson: _weaponToJson)
  final WeaponType weapon;
  final int rarity;
  final String affiliation;
  final String constellationName;
  final String birthday;
  final String description;
  @JsonKey(name: "skillTalents")
  final List<Talent> talents;
  final List<Talent> passiveTalents;
  final List<Constellation> constellations;

  Character(
      this.name,
      this.vision,
      this.weapon,
      this.rarity,
      this.affiliation,
      this.constellationName,
      this.birthday,
      this.description,
      this.talents,
      this.passiveTalents,
      this.constellations);

  factory Character.fromJson(Map<String,dynamic> json) => _$CharacterFromJson(json);

  Map<String,dynamic> toJson() => _$CharacterToJson(this);

  static Vision _visionFromJson(String vision) {
    switch (vision) {
      case "Anemo":
        return Vision.anemo;
      case "Cryo":
        return Vision.cryo;
      case "Dendro":
        return Vision.dendro;
      case "Electro":
        return Vision.electro;
      case "Geo":
        return Vision.geo;
      case "Hydro":
        return Vision.hydro;
      case "Pyro":
        return Vision.pyro;
      default:
        return Vision.unknown;
    }
  }

  static WeaponType _weaponFromJson(String weapon) {
    switch (weapon) {
      case "Bow":
        return WeaponType.bow;
      case "Catalyst":
        return WeaponType.catalyst;
      case "Claymore":
        return WeaponType.claymore;
      case "Polearm":
        return WeaponType.polearm;
      case "Sword":
        return WeaponType.sword;
      default:
        return WeaponType.unkown;
    }
  }

  static String _weaponToJson(WeaponType weapon) {
    switch (weapon) {
      case WeaponType.bow:
        return "Bow";
      case WeaponType.catalyst:
        return "Catalyst";
      case WeaponType.claymore:
        return "Claymore";
      case WeaponType.polearm:
        return "Polearm";
      case WeaponType.sword:
        return "Sword";
      default:
        return "";
    }
  }
}
