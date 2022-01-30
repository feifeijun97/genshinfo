import 'enum.dart';

enum Vision { none, pyro, cryo, anemo, geo, electro, hydro, dendro }
enum TalentType { normalAttack, elementSkill, elementBurst }

class Talent {
  final String name;
  final String unlock;
  final String description;
  final TalentType type;

  const Talent(
      {required this.name,
      required this.unlock,
      required this.description,
      required this.type});
}
class Constellation {
  final String name;
  final String unlock;
  final String description;
  final int level;

  const Constellation(
      {required this.name,
      required this.unlock,
      required this.description,
      required this.level});
}
class Character {
  final String name;
  final Vision vision;
  final WeaponType weapon;
  final int rarity;
  final String affiliation;
  final String constellationName;
  final String birthday;
  final String description;
  final List<Talent> talent;
  final List<Talent> passiveTalent;
  final List<Constellation> constellation;

  Character(this.name, this.vision, this.weapon, this.rarity, this.affiliation, this.constellationName, this.birthday, this.description, this.talent, this.passiveTalent, this.constellation);
}
