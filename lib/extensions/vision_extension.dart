import 'package:genshin_api/genshin_api.dart' show Vision;
import 'package:hexcolor/hexcolor.dart';

extension VisionsExtensions on Vision {
  String getAssetPath() {
    // ignore: unnecessary_this
    return 'images/element/normal/${this.name.toLowerCase()}.png';
  }

  HexColor getVisionTextColor() {
    switch (this) {
      case Vision.pyro:
        return HexColor('#fe925d');
      case Vision.cryo:
        return HexColor("3b83bd");
      case Vision.anemo:
        return HexColor('#72e2c3');
      case Vision.geo:
        return HexColor('#e3b342');
      case Vision.electro:
        return HexColor('#A754DC');
      case Vision.hydro:
        return HexColor('#21e1eb');
      case Vision.dendro:
        return HexColor('#2FD340');
    }
  }

  List<HexColor> getVisionHexColor() {
    switch (this) {
      case Vision.pyro:
        return [
          HexColor('#E46F0D'),
          HexColor('#F9A661'),
        ];
      case Vision.cryo:
        return [
          HexColor('#448DC7'),
          HexColor('#77B8EB'),
        ];
      case Vision.anemo:
        return [
          HexColor('#019E8A'),
          HexColor('#48FFE8'),
        ];
      case Vision.geo:
        return [
          HexColor('#9a6604'),
          HexColor('#ffd589'),
        ];
      case Vision.electro:
        return [
          HexColor('#61459c'),
          HexColor('#7b5db7'),
        ];
      case Vision.hydro:
        return [
          HexColor('#07519D'),
          HexColor('#459CF5'),
        ];
      case Vision.dendro:
        return [
          HexColor('#04862A'),
          HexColor('#00BC37'),
        ];
    }
  }
}
