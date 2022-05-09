import 'package:flutter_test/flutter_test.dart';
import 'package:genshinfo/extensions/string_extension.dart';
import 'package:genshin_api/genshin_api.dart' show Vision, WeaponType;
import 'package:genshinfo/extensions/vision_extension.dart';
import 'package:genshinfo/extensions/weapon_type_extension.dart';

void main() {
  group('extension test', () {
    test('capitalize string', () {
      expect('string'.capitalize(), "String");
    });

    test('get enum asset path', () {
      const anemo = Vision.anemo;
      const sword = WeaponType.sword;

      expect(anemo.getAssetPath(), 'images/element/normal/anemo.png');
      expect(sword.getAssetPath(), 'images/weapon/sword.png');
    });
  });
}
