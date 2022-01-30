

import 'enum.dart';

class Weapon{
  final String name;
  final WeaponType type;
  final int rarity;
  final int baseAttack;
  final String subStat;
  final String passiveName;
  final String passiveDesc;
  final String location;

  Weapon(this.name, this.type, this.rarity, this.baseAttack, this.subStat, this.passiveName, this.passiveDesc, this.location);
}