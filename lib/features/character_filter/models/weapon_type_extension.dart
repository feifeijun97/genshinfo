import 'package:genshin_api/genshin_api.dart' show WeaponType;

extension VisionsExtensions on WeaponType {
  String getAssetPath() {
    // ignore: unnecessary_this
    return 'images/weapon/${this.name.toLowerCase()}.png';
  }

  // HexColor getHexColor() {
  //   switch(this){
  //     case WeaponType.sword:
  //       // TODO: Handle this case.
  //       break;
  //     case WeaponType.bow:
  //       // TODO: Handle this case.
  //       break;
  //     case WeaponType.catalyst:
  //       // TODO: Handle this case.
  //       break;
  //     case WeaponType.claymore:
  //       // TODO: Handle this case.
  //       break;
  //     case WeaponType.polearm:
  //       // TODO: Handle this case.
  //       break;
  //   }

}
