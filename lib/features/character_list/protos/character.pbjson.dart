///
//  Generated code. Do not modify.
//  source: character.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use weaponTypesDescriptor instead')
const WeaponTypes$json = const {
  '1': 'WeaponTypes',
  '2': const [
    const {'1': 'ALL_WEAPON', '2': 0},
    const {'1': 'CLAYMORE', '2': 1},
    const {'1': 'SWORD', '2': 2},
    const {'1': 'BOW', '2': 3},
    const {'1': 'POLEARM', '2': 4},
    const {'1': 'CATALYST', '2': 5},
  ],
};

/// Descriptor for `WeaponTypes`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List weaponTypesDescriptor = $convert.base64Decode('CgtXZWFwb25UeXBlcxIOCgpBTExfV0VBUE9OEAASDAoIQ0xBWU1PUkUQARIJCgVTV09SRBACEgcKA0JPVxADEgsKB1BPTEVBUk0QBBIMCghDQVRBTFlTVBAF');
@$core.Deprecated('Use regionsDescriptor instead')
const Regions$json = const {
  '1': 'Regions',
  '2': const [
    const {'1': 'ALL_REGION', '2': 0},
    const {'1': 'MONDSTADT', '2': 1},
    const {'1': 'LIYUE', '2': 2},
    const {'1': 'INAZUMA', '2': 3},
  ],
};

/// Descriptor for `Regions`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List regionsDescriptor = $convert.base64Decode('CgdSZWdpb25zEg4KCkFMTF9SRUdJT04QABINCglNT05EU1RBRFQQARIJCgVMSVlVRRACEgsKB0lOQVpVTUEQAw==');
@$core.Deprecated('Use visionsDescriptor instead')
const Visions$json = const {
  '1': 'Visions',
  '2': const [
    const {'1': 'ALL_VISION', '2': 0},
    const {'1': 'PYRO', '2': 1},
    const {'1': 'CYRO', '2': 2},
    const {'1': 'HYDRO', '2': 3},
    const {'1': 'ANEMO', '2': 4},
    const {'1': 'ELECTRO', '2': 5},
    const {'1': 'GEO', '2': 6},
    const {'1': 'DENDRO', '2': 7},
  ],
};

/// Descriptor for `Visions`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List visionsDescriptor = $convert.base64Decode('CgdWaXNpb25zEg4KCkFMTF9WSVNJT04QABIICgRQWVJPEAESCAoEQ1lSTxACEgkKBUhZRFJPEAMSCQoFQU5FTU8QBBILCgdFTEVDVFJPEAUSBwoDR0VPEAYSCgoGREVORFJPEAc=');
@$core.Deprecated('Use genderDescriptor instead')
const Gender$json = const {
  '1': 'Gender',
  '2': const [
    const {'1': 'MALE', '2': 0},
    const {'1': 'FEMALE', '2': 1},
  ],
};

/// Descriptor for `Gender`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List genderDescriptor = $convert.base64Decode('CgZHZW5kZXISCAoETUFMRRAAEgoKBkZFTUFMRRAB');
@$core.Deprecated('Use characterListRequestDescriptor instead')
const CharacterListRequest$json = const {
  '1': 'CharacterListRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    const {'1': 'region', '3': 2, '4': 1, '5': 14, '6': '.character.Regions', '9': 1, '10': 'region', '17': true},
    const {'1': 'rarity', '3': 3, '4': 1, '5': 5, '9': 2, '10': 'rarity', '17': true},
    const {'1': 'WeaponType', '3': 4, '4': 1, '5': 14, '6': '.character.WeaponTypes', '9': 3, '10': 'WeaponType', '17': true},
    const {'1': 'Vision', '3': 5, '4': 1, '5': 14, '6': '.character.Visions', '9': 4, '10': 'Vision', '17': true},
  ],
  '8': const [
    const {'1': '_name'},
    const {'1': '_region'},
    const {'1': '_rarity'},
    const {'1': '_WeaponType'},
    const {'1': '_Vision'},
  ],
};

/// Descriptor for `CharacterListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List characterListRequestDescriptor = $convert.base64Decode('ChRDaGFyYWN0ZXJMaXN0UmVxdWVzdBIXCgRuYW1lGAEgASgJSABSBG5hbWWIAQESLwoGcmVnaW9uGAIgASgOMhIuY2hhcmFjdGVyLlJlZ2lvbnNIAVIGcmVnaW9uiAEBEhsKBnJhcml0eRgDIAEoBUgCUgZyYXJpdHmIAQESOwoKV2VhcG9uVHlwZRgEIAEoDjIWLmNoYXJhY3Rlci5XZWFwb25UeXBlc0gDUgpXZWFwb25UeXBliAEBEi8KBlZpc2lvbhgFIAEoDjISLmNoYXJhY3Rlci5WaXNpb25zSARSBlZpc2lvbogBAUIHCgVfbmFtZUIJCgdfcmVnaW9uQgkKB19yYXJpdHlCDQoLX1dlYXBvblR5cGVCCQoHX1Zpc2lvbg==');
@$core.Deprecated('Use characterListResponseDescriptor instead')
const CharacterListResponse$json = const {
  '1': 'CharacterListResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'rarity', '3': 3, '4': 1, '5': 5, '10': 'rarity'},
    const {'1': 'vision', '3': 4, '4': 1, '5': 14, '6': '.character.Visions', '10': 'vision'},
    const {'1': 'imageUrl', '3': 5, '4': 1, '5': 9, '10': 'imageUrl'},
    const {'1': 'gender', '3': 6, '4': 1, '5': 14, '6': '.character.Gender', '10': 'gender'},
  ],
};

/// Descriptor for `CharacterListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List characterListResponseDescriptor = $convert.base64Decode('ChVDaGFyYWN0ZXJMaXN0UmVzcG9uc2USDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSFgoGcmFyaXR5GAMgASgFUgZyYXJpdHkSKgoGdmlzaW9uGAQgASgOMhIuY2hhcmFjdGVyLlZpc2lvbnNSBnZpc2lvbhIaCghpbWFnZVVybBgFIAEoCVIIaW1hZ2VVcmwSKQoGZ2VuZGVyGAYgASgOMhEuY2hhcmFjdGVyLkdlbmRlclIGZ2VuZGVy');
