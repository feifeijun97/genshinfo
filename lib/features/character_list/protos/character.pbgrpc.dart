///
//  Generated code. Do not modify.
//  source: character.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'character.pb.dart' as $0;
export 'character.pb.dart';

class CharacterListServiceClient extends $grpc.Client {
  static final _$characterList =
      $grpc.ClientMethod<$0.CharacterListRequest, $0.CharacterListResponse>(
          '/character.CharacterListService/CharacterList',
          ($0.CharacterListRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CharacterListResponse.fromBuffer(value));

  CharacterListServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CharacterListResponse> characterList(
      $0.CharacterListRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$characterList, request, options: options);
  }
}

abstract class CharacterListServiceBase extends $grpc.Service {
  $core.String get $name => 'character.CharacterListService';

  CharacterListServiceBase() {
    $addMethod(
        $grpc.ServiceMethod<$0.CharacterListRequest, $0.CharacterListResponse>(
            'CharacterList',
            characterList_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.CharacterListRequest.fromBuffer(value),
            ($0.CharacterListResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CharacterListResponse> characterList_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.CharacterListRequest> request) async {
    return characterList(call, await request);
  }

  $async.Future<$0.CharacterListResponse> characterList(
      $grpc.ServiceCall call, $0.CharacterListRequest request);
}
