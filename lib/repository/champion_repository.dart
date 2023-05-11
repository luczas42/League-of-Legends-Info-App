import 'package:variables/client/champion_client.dart';

import '../model/champion.dart';

class ChampionRepository {

  Future<List<Champion>> fecthChampions() async {
    var data = await ChampionClient().fetchFromApi();
    List<Champion> championList = [];
    data.forEach (
      (champion, info) {
        championList.add(
          Champion.fromJson(info),
        );
      },
    );
    return championList;
  }
}
                                                                                                                