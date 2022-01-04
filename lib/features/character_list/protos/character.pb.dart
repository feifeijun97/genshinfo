///
//  Generated code. Do not modify.
//  source: character.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'character.pbenum.dart';

export 'character.pbenum.dart';

class CharacterListRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CharacterListRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'character'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..e<Regions>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'region', $pb.PbFieldType.OE, defaultOrMaker: Regions.ALL_REGION, valueOf: Regions.valueOf, enumValues: Regions.values)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rarity', $pb.PbFieldType.O3)
    ..e<WeaponTypes>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'WeaponType', $pb.PbFieldType.OE, protoName: 'WeaponType', defaultOrMaker: WeaponTypes.ALL_WEAPON, valueOf: WeaponTypes.valueOf, enumValues: WeaponTypes.values)
    ..e<Visions>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Vision', $pb.PbFieldType.OE, protoName: 'Vision', defaultOrMaker: Visions.ALL_VISION, valueOf: Visions.valueOf, enumValues: Visions.values)
    ..hasRequiredFields = false
  ;

  CharacterListRequest._() : super();
  factory CharacterListRequest({
    $core.String? name,
    Regions? region,
    $core.int? rarity,
    WeaponTypes? weaponType,
    Visions? vision,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (region != null) {
      _result.region = region;
    }
    if (rarity != null) {
      _result.rarity = rarity;
    }
    if (weaponType != null) {
      _result.weaponType = weaponType;
    }
    if (vision != null) {
      _result.vision = vision;
    }
    return _result;
  }
  factory CharacterListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CharacterListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CharacterListRequest clone() => CharacterListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CharacterListRequest copyWith(void Function(CharacterListRequest) updates) => super.copyWith((message) => updates(message as CharacterListRequest)) as CharacterListRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CharacterListRequest create() => CharacterListRequest._();
  CharacterListRequest createEmptyInstance() => create();
  static $pb.PbList<CharacterListRequest> createRepeated() => $pb.PbList<CharacterListRequest>();
  @$core.pragma('dart2js:noInline')
  static CharacterListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CharacterListRequest>(create);
  static CharacterListRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  Regions get region => $_getN(1);
  @$pb.TagNumber(2)
  set region(Regions v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRegion() => $_has(1);
  @$pb.TagNumber(2)
  void clearRegion() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get rarity => $_getIZ(2);
  @$pb.TagNumber(3)
  set rarity($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRarity() => $_has(2);
  @$pb.TagNumber(3)
  void clearRarity() => clearField(3);

  @$pb.TagNumber(4)
  WeaponTypes get weaponType => $_getN(3);
  @$pb.TagNumber(4)
  set weaponType(WeaponTypes v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasWeaponType() => $_has(3);
  @$pb.TagNumber(4)
  void clearWeaponType() => clearField(4);

  @$pb.TagNumber(5)
  Visions get vision => $_getN(4);
  @$pb.TagNumber(5)
  set vision(Visions v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasVision() => $_has(4);
  @$pb.TagNumber(5)
  void clearVision() => clearField(5);
}

class CharacterListResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CharacterListResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'character'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'rarity', $pb.PbFieldType.O3)
    ..e<Visions>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'vision', $pb.PbFieldType.OE, defaultOrMaker: Visions.ALL_VISION, valueOf: Visions.valueOf, enumValues: Visions.values)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'imageUrl', protoName: 'imageUrl')
    ..e<Gender>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender', $pb.PbFieldType.OE, defaultOrMaker: Gender.MALE, valueOf: Gender.valueOf, enumValues: Gender.values)
    ..hasRequiredFields = false
  ;

  CharacterListResponse._() : super();
  factory CharacterListResponse({
    $core.String? id,
    $core.String? name,
    $core.int? rarity,
    Visions? vision,
    $core.String? imageUrl,
    Gender? gender,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (rarity != null) {
      _result.rarity = rarity;
    }
    if (vision != null) {
      _result.vision = vision;
    }
    if (imageUrl != null) {
      _result.imageUrl = imageUrl;
    }
    if (gender != null) {
      _result.gender = gender;
    }
    return _result;
  }
  factory CharacterListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CharacterListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CharacterListResponse clone() => CharacterListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CharacterListResponse copyWith(void Function(CharacterListResponse) updates) => super.copyWith((message) => updates(message as CharacterListResponse)) as CharacterListResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CharacterListResponse create() => CharacterListResponse._();
  CharacterListResponse createEmptyInstance() => create();
  static $pb.PbList<CharacterListResponse> createRepeated() => $pb.PbList<CharacterListResponse>();
  @$core.pragma('dart2js:noInline')
  static CharacterListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CharacterListResponse>(create);
  static CharacterListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get rarity => $_getIZ(2);
  @$pb.TagNumber(3)
  set rarity($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRarity() => $_has(2);
  @$pb.TagNumber(3)
  void clearRarity() => clearField(3);

  @$pb.TagNumber(4)
  Visions get vision => $_getN(3);
  @$pb.TagNumber(4)
  set vision(Visions v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasVision() => $_has(3);
  @$pb.TagNumber(4)
  void clearVision() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get imageUrl => $_getSZ(4);
  @$pb.TagNumber(5)
  set imageUrl($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasImageUrl() => $_has(4);
  @$pb.TagNumber(5)
  void clearImageUrl() => clearField(5);

  @$pb.TagNumber(6)
  Gender get gender => $_getN(5);
  @$pb.TagNumber(6)
  set gender(Gender v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasGender() => $_has(5);
  @$pb.TagNumber(6)
  void clearGender() => clearField(6);
}

