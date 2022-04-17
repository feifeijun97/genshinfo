import 'package:json_annotation/json_annotation.dart';
import 'weapon_type.dart';

part 'character.g.dart';

enum Vision {
  @JsonValue('Pyro')
  pyro,
  @JsonValue('Cryo')
  cryo,
  @JsonValue('Anemo')
  anemo,
  @JsonValue('Geo')
  geo,
  @JsonValue('Electro')
  electro,
  @JsonValue('Hydro')
  hydro,
  @JsonValue('Dendro')
  dendro,
  unknown
}
enum TalentType { normalAttack, elementSkill, elementBurst, unknown }

@JsonSerializable()
class Talent {
  final String name;
  @JsonKey(required: false, defaultValue: "")
  final String unlock;
  final String description;
  @JsonKey(
      fromJson: _talentTypeFromJson,
      required: false,
      defaultValue: TalentType.unknown)
  final TalentType type;
  @JsonKey(required: false, defaultValue: 0)
  final int level;

  Talent(this.name, this.unlock, this.description, this.type, this.level);

  factory Talent.fromJson(Map<String, dynamic> json) => _$TalentFromJson(json);

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

  factory Constellation.fromJson(Map<String, dynamic> json) =>
      _$ConstellationFromJson(json);
  // const Constellation(
  //     {required this.name,
  //     required this.unlock,
  //     required this.description,
  //     required this.level});
}

@JsonSerializable()
class Character {
  final String name;
  @JsonKey(unknownEnumValue: Vision.unknown)
  final Vision vision;
  @JsonKey(unknownEnumValue: WeaponType.unkown, toJson: _weaponToJson)
  final WeaponType weapon;
  final int rarity;
  final String affiliation;
  @JsonKey(name: "constellation")
  final String constellationName;
  @JsonKey(includeIfNull: false)
  final String? birthday;
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

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);

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
