import 'dart:convert';

import 'package:variables/src/data/model/passive_model.dart';
import 'package:variables/src/data/model/spells.dart';
import 'package:variables/src/domain/entities/champion_entitiy.dart';

class ChampionDetailsModel extends ChampionEntity {
  ChampionDetailsModel.detailed(
      {required super.title,
      required super.championName,
      required super.blurb,
      required super.championId,
      required super.lore,
      required super.partype,
      required super.roles,
      required super.spells,
      required super.passive,
      required super.championKey})
      : super.detailed();

  factory ChampionDetailsModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> rolesFromJson = json['tags'];
    List<String> roleList = [];
    for (var element in rolesFromJson) {
      roleList.add(element);
    }
    return ChampionDetailsModel.detailed(
        championName: json['name'],
        championId: json['id'],
        title: json['title'],
        blurb: json['blurb'],
        lore: json['lore'],
        partype: json['partype'],
        roles: roleList,
        spells: List<SpellsModel>.from(
          json['spells'].map(
            (x) => SpellsModel.fromJson(x),
          ),
        ),
        passive: PassiveModel.fromJson(json['passive']),
        championKey: json['key']);
  }

  String titleToCapitalized() {
    return title[0].toUpperCase() + title.substring(1);
  }

  String keyToFourDigitString() {
    return championKey!.padLeft(4, '0');
  }

  String getPassiveVideoUri() {
    return 'https://d28xe8vt774jo5.cloudfront.net/champion-abilities/${keyToFourDigitString()}/ability_${keyToFourDigitString()}_P1.webm';
  }

  String getSpellVideoUri(int position) {
    switch (position) {
      case 0:
        return 'https://d28xe8vt774jo5.cloudfront.net/champion-abilities/${keyToFourDigitString()}/ability_${keyToFourDigitString()}_Q1.webm';
      case 1:
        return 'https://d28xe8vt774jo5.cloudfront.net/champion-abilities/${keyToFourDigitString()}/ability_${keyToFourDigitString()}_W1.webm';
      case 2:
        return 'https://d28xe8vt774jo5.cloudfront.net/champion-abilities/${keyToFourDigitString()}/ability_${keyToFourDigitString()}_E1.webm';
      case 3:
        return 'https://d28xe8vt774jo5.cloudfront.net/champion-abilities/${keyToFourDigitString()}/ability_${keyToFourDigitString()}_R1.webm';
    }
    return "";
  }

  String loreToUTF8() {
    List<int> encoded = latin1.encode(lore!);
    return utf8.decode(encoded);
  }
}
