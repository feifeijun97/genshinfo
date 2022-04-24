import 'package:json_annotation/json_annotation.dart';

enum WeaponType {
  @JsonValue('Sword')
  sword,
  @JsonValue('Bow')
  bow,
  @JsonValue('Catalyst')
  catalyst,
  @JsonValue('Claymore')
  claymore,
  @JsonValue('Polearm')
  polearm,
}
