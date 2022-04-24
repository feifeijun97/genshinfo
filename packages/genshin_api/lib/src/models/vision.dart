import 'package:json_annotation/json_annotation.dart';

enum Vision {
  @JsonValue('Anemo')
  anemo,
  @JsonValue('Cryo')
  cryo,
  @JsonValue('Dendro')
  dendro,
  @JsonValue('Electro')
  electro,
  @JsonValue('Geo')
  geo,
  @JsonValue('Hydro')
  hydro,
  @JsonValue('Pyro')
  pyro,
}
