import 'package:variables/src/data/client/champion_client.dart';

import '../../domain/model/champion.dart';
import '../../locator.dart';

class ChampionRepository {
  Future<List<Champion>> fecthChampions() async {
    var data = await locator.get<ChampionClient>().fetchFromApi();
    List<Champion> championList = [];
    data.forEach(
      (champion, info) {
        championList.add(
          Champion.fromJson(info),
        );
      },
    );
    return championList;
  }
}
