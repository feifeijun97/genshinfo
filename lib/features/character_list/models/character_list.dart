import 'package:genshinfo/features/character_list/protos/character.pbgrpc.dart';
import 'package:genshinfo/services/grpc_client.dart';
import 'package:grpc/grpc.dart';

class CharacterList {
  getCharacterListFromServer() {
    ClientChannel channel = GrpcClient().client;
    CharacterListServiceClient stub = CharacterListServiceClient(channel,
        options: CallOptions(timeout: const Duration(seconds: 30)));
  }
}
