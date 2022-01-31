import 'package:json_annotation/json_annotation.dart';

part 'artifact.g.dart';

@JsonSerializable()
class Artifact{
  final String name;
  @JsonKey(name: "max_rarity")
  final int maxRarity;
  @JsonKey(name:"2-pieces_bonus")
  final String twoPiecesBonus;
  @JsonKey(name: "4-pieces_bonus")
  final String fourPiecesBonus;

  Artifact(this.name, this.maxRarity, this.twoPiecesBonus, this.fourPiecesBonus);

  factory Artifact.fromJson(Map<String, dynamic> json)=> _$ArtifactFromJson(json);
}