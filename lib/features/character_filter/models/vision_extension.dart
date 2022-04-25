import 'package:genshin_api/genshin_api.dart' show Vision;
import 'package:hexcolor/hexcolor.dart';

extension VisionsExtensions on Vision {
  String getAssetPath() {
    // ignore: unnecessary_this
    return 'images/element/normal/${this.name.toLowerCase()}.png';
  }

  HexColor getHexColor() {
    switch (this) {
      case Vision.anemo:
        return HexColor("#72e2c3");
      case Vision.cryo:
        return HexColor("#a0e9e5");
      case Vision.dendro:
        return HexColor("#23c18a");
      case Vision.electro:
        return HexColor("#a757cb");
      case Vision.geo:
        return HexColor("#e3b342");
      case Vision.hydro:
        return HexColor("#21e1eb");
      case Vision.pyro:
        return HexColor("#fe925d");
    }
  }
}
