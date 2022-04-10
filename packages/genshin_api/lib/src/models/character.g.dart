// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Talent _$TalentFromJson(Map<String, dynamic> json) => Talent(
      json['name'] as String,
      json['unlock'] as String? ?? '',
      json['description'] as String,
      json['type'] == null
          ? TalentType.unknown
          : Talent._talentTypeFromJson(json['type'] as String),
      json['level'] as int? ?? 0,
    );

Map<String, dynamic> _$TalentToJson(Talent instance) => <String, dynamic>{
      'name': instance.name,
      'unlock': instance.unlock,
      'description': instance.description,
      'type': _$TalentTypeEnumMap[instance.type],
      'level': instance.level,
    };

const _$TalentTypeEnumMap = {
  TalentType.normalAttack: 'normalAttack',
  TalentType.elementSkill: 'elementSkill',
  TalentType.elementBurst: 'elementBurst',
  TalentType.unknown: 'unknown',
};

Constellation _$ConstellationFromJson(Map<String, dynamic> json) =>
    Constellation(
      json['name'] as String,
      json['unlock'] as String,
      json['description'] as String,
      json['level'] as int,
    );

Map<String, dynamic> _$ConstellationToJson(Constellation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'unlock': instance.unlock,
      'description': instance.description,
      'level': instance.level,
    };

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      json['name'] as String,
      $enumDecode(_$VisionEnumMap, json['vision'],
          unknownValue: Vision.unknown),
      $enumDecode(_$WeaponTypeEnumMap, json['weapon'],
          unknownValue: WeaponType.unkown),
      json['rarity'] as int,
      json['affiliation'] as String,
      json['constellation'] as String,
      json['birthday'] as String,
      json['description'] as String,
      (json['skillTalents'] as List<dynamic>)
          .map((e) => Talent.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['passiveTalents'] as List<dynamic>)
          .map((e) => Talent.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['constellations'] as List<dynamic>)
          .map((e) => Constellation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'name': instance.name,
      'vision': _$VisionEnumMap[instance.vision],
      'weapon': Character._weaponToJson(instance.weapon),
      'rarity': instance.rarity,
      'affiliation': instance.affiliation,
      'constellation': instance.constellationName,
      'birthday': instance.birthday,
      'description': instance.description,
      'skillTalents': instance.talents,
      'passiveTalents': instance.passiveTalents,
      'constellations': instance.constellations,
    };

const _$VisionEnumMap = {
  Vision.pyro: 'Pyro',
  Vision.cryo: 'Cryo',
  Vision.anemo: 'Anemo',
  Vision.geo: 'Geo',
  Vision.electro: 'Electro',
  Vision.hydro: 'Hydro',
  Vision.dendro: 'Dendro',
  Vision.unknown: 'unknown',
};

const _$WeaponTypeEnumMap = {
  WeaponType.sword: 'Sword',
  WeaponType.bow: 'Bow',
  WeaponType.catalyst: 'Catalyst',
  WeaponType.claymore: 'Claymore',
  WeaponType.polearm: 'Polearm',
  WeaponType.unkown: 'unkown',
};
