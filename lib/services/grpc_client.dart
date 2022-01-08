import 'package:grpc/grpc.dart';
//https://medium.com/flutter-community/flutter-grpc-810f87612c6d
class GrpcClient {
  late ClientChannel client;
  static final GrpcClient _singleton =
  GrpcClient._internal();

  factory GrpcClient() => _singleton;

  GrpcClient._internal() {
    // 10.0.2.2 is ip for emulator, real device might change to 127.0.0.1.
    client = ClientChannel("10.0.2.2", 
        port: 50051,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
          idleTimeout: Duration(minutes: 1),
        ));
  }
}
