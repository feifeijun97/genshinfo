///
//  Generated code. Do not modify.
//  source: character.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class WeaponTypes extends $pb.ProtobufEnum {
  static const WeaponTypes ALL_WEAPON = WeaponTypes._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ALL_WEAPON');
  static const WeaponTypes CLAYMORE = WeaponTypes._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CLAYMORE');
  static const WeaponTypes SWORD = WeaponTypes._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SWORD');
  static const WeaponTypes BOW = WeaponTypes._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'BOW');
  static const WeaponTypes POLEARM = WeaponTypes._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'POLEARM');
  static const WeaponTypes CATALYST = WeaponTypes._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CATALYST');

  static const $core.List<WeaponTypes> values = <WeaponTypes> [
    ALL_WEAPON,
    CLAYMORE,
    SWORD,
    BOW,
    POLEARM,
    CATALYST,
  ];

  static final $core.Map<$core.int, WeaponTypes> _byValue = $pb.ProtobufEnum.initByValue(values);
  static WeaponTypes? valueOf($core.int value) => _byValue[value];

  const WeaponTypes._($core.int v, $core.String n) : super(v, n);
}

class Regions extends $pb.ProtobufEnum {
  static const Regions ALL_REGION = Regions._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ALL_REGION');
  static const Regions MONDSTADT = Regions._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MONDSTADT');
  static const Regions LIYUE = Regions._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'LIYUE');
  static const Regions INAZUMA = Regions._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INAZUMA');

  static const $core.List<Regions> values = <Regions> [
    ALL_REGION,
    MONDSTADT,
    LIYUE,
    INAZUMA,
  ];

  static final $core.Map<$core.int, Regions> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Regions? valueOf($core.int value) => _byValue[value];

  const Regions._($core.int v, $core.String n) : super(v, n);
}

class Visions extends $pb.ProtobufEnum {
  static const Visions ALL_VISION = Visions._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ALL_VISION');
  static const Visions PYRO = Visions._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'PYRO');
  static const Visions CYRO = Visions._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CYRO');
  static const Visions HYDRO = Visions._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'HYDRO');
  static const Visions ANEMO = Visions._(4, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ANEMO');
  static const Visions ELECTRO = Visions._(5, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ELECTRO');
  static const Visions GEO = Visions._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'GEO');
  static const Visions DENDRO = Visions._(7, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DENDRO');

  static const $core.List<Visions> values = <Visions> [
    ALL_VISION,
    PYRO,
    CYRO,
    HYDRO,
    ANEMO,
    ELECTRO,
    GEO,
    DENDRO,
  ];

  static final $core.Map<$core.int, Visions> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Visions? valueOf($core.int value) => _byValue[value];

  const Visions._($core.int v, $core.String n) : super(v, n);
}

class Gender extends $pb.ProtobufEnum {
  static const Gender MALE = Gender._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MALE');
  static const Gender FEMALE = Gender._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FEMALE');

  static const $core.List<Gender> values = <Gender> [
    MALE,
    FEMALE,
  ];

  static final $core.Map<$core.int, Gender> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Gender? valueOf($core.int value) => _byValue[value];

  const Gender._($core.int v, $core.String n) : super(v, n);
}

