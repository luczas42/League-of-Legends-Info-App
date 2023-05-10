class ChampionResponse {
  final String type;
  final List<Champion> champion;
  ChampionResponse({required this.type, required this.champion});

  factory ChampionResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Champion> championList =
        list.map((e) => Champion.fromJson(e)).toList();
    return ChampionResponse(type: json['type'], champion: championList);
  }
}

class Champion {
  String skinUrl = "";
  String splashUrl = "";
  final String championName;
  String skinName = "";

  Champion({required this.championName});

  factory Champion.fromJson(Map<String, dynamic> json) {
    return Champion(championName: json['name']);
  }
}
