import '../../domain/entities/champion_entitiy.dart';

class ChampionEntryModel extends ChampionEntity {
  ChampionEntryModel(
      {required super.title,
      required super.championName,
      required super.blurb,
      required super.championId});

    
  factory ChampionEntryModel.fromJson(Map<String, dynamic> json) {
    return ChampionEntryModel(
      championName: json['name'],
      championId: json['id'],
      title: json['title'],
      blurb: json['blurb'],
    );
  }

  String titleToCapitalized() {
    return title[0].toUpperCase() + title.substring(1);
  }
}
