import 'package:variables/src/domain/entities/passive.dart';
import 'package:variables/src/domain/entities/spells.dart';

class ChampionEntity {
  final String title;
  final String championName;
  final String blurb;
  final String championId;
  String? lore;
  List<String>? roles;
  String? partype;
  Passive? passive;
  List<Spells>? spells;
  String? championKey;

  ChampionEntity({
    required this.title,
    required this.championName,
    required this.blurb,
    required this.championId,
  });

  ChampionEntity.detailed(
      {required this.title,
      required this.championName,
      required this.blurb,
      required this.championId,
      required this.lore,
      required this.partype,
      required this.roles,
      required this.spells,
      required this.passive,
      required this.championKey});
}
