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
  String title = "";
  String splashUrl = "";
  final String championName;
  String skinName = "";
  String blurb = "";

  Champion(
      {required this.championName,
      required this.splashUrl,
      required this.title,
      required this.blurb});

  factory Champion.fromJson(Map<String, dynamic> json) {
    return Champion(
      championName: json['name'],
      splashUrl: json['id'],
      title: json['title'],
      blurb: json['blurb'],
    );
  }

  String titleToCapitalized() {
    return title[0].toUpperCase()+title.substring(1);
  }
}