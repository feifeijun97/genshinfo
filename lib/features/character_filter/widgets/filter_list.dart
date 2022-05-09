import 'package:flutter/material.dart';
import 'package:genshin_api/genshin_api.dart' show Vision, WeaponType;
import 'package:genshinfo/extensions/vision_extension.dart';
import 'package:genshinfo/extensions/weapon_type_extension.dart';

class FilterList extends StatelessWidget {
  final List<Object> selectedItems;
  final Function(Object) callback;

  const FilterList({
    Key? key,
    required this.callback,
    this.selectedItems = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> iconButtons = [];
    if (selectedItems is List<Vision>) {
      iconButtons = Vision.values.map(((e) => _iconButtons(e))).toList();
    } else if (selectedItems is List<WeaponType>) {
      iconButtons = WeaponType.values.map(((e) => _iconButtons(e))).toList();
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: iconButtons,
    );
  }

  Widget _iconButtons(Object item) {
    String imagePath = "";
    // HexColor hexColor = HexColor("#ffffff");
    if (item is Vision) {
      imagePath = item.getAssetPath();
      // hexColor = item.getHexColor();
    } else if (item is WeaponType) {
      imagePath = item.getAssetPath();
    }

    return GestureDetector(
      child: Opacity(
        opacity: selectedItems.contains(item) ? 1 : 0.2,
        child: Image(
          image: AssetImage(imagePath),
          height: 24,
          width: 24,
        ),
      ),
      onTap: () => callback(item),
    );
  }
}
