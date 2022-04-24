// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weapon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weapon _$WeaponFromJson(Map<String, dynamic> json) => Weapon(
      json['name'] as String,
      $enumDecode(_$WeaponTypeEnumMap, json['type']),
      json['rarity'] as int,
      json['baseAttack'] as int,
      json['subStat'] as String,
      json['passiveName'] as String,
      json['passiveDesc'] as String,
      json['location'] as String,
    );

Map<String, dynamic> _$WeaponToJson(Weapon instance) => <String, dynamic>{
      'name': instance.name,
      'type': _$WeaponTypeEnumMap[instance.type],
      'rarity': instance.rarity,
      'baseAttack': instance.baseAttack,
      'subStat': instance.subStat,
      'passiveName': instance.passiveName,
      'passiveDesc': instance.passiveDesc,
      'location': instance.location,
    };

const _$WeaponTypeEnumMap = {
  WeaponType.sword: 'Sword',
  WeaponType.bow: 'Bow',
  WeaponType.catalyst: 'Catalyst',
  WeaponType.claymore: 'Claymore',
  WeaponType.polearm: 'Polearm',
};
