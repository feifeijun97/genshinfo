// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artifact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Artifact _$ArtifactFromJson(Map<String, dynamic> json) => Artifact(
      json['name'] as String,
      json['max_rarity'] as int,
      json['2-pieces_bonus'] as String,
      json['4-pieces_bonus'] as String,
    );

Map<String, dynamic> _$ArtifactToJson(Artifact instance) => <String, dynamic>{
      'name': instance.name,
      'max_rarity': instance.maxRarity,
      '2-pieces_bonus': instance.twoPiecesBonus,
      '4-pieces_bonus': instance.fourPiecesBonus,
    };
