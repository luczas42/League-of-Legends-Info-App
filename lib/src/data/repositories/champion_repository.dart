import 'package:variables/src/data/client/champion_client_impl.dart';
import 'package:variables/src/data/model/champion_details_model.dart';
import 'package:variables/src/domain/repositories/champion_repository_impl.dart';

import '../model/champion_entry_model.dart';

class ChampionRepository implements IChampionRepository {
  final IChampionClient iChampionClient;

  ChampionRepository(this.iChampionClient);

  @override
  Future<List<ChampionEntryModel>> fetchChampions() async {
    var data = await iChampionClient.fetchFromApi();
    List<ChampionEntryModel> championList = [];
    data.forEach(
      (champion, info) {
        championList.add(
          ChampionEntryModel.fromJson(info),
        );
      },
    );
    return championList;
  }

  @override
  Future<ChampionDetailsModel> fetchChampionByID(String id) async {
    var data = await iChampionClient.fetchById(id);
    ChampionDetailsModel champion = ChampionDetailsModel.detailed(
        title: "",
        championName: "",
        blurb: "",
        championId: "",
        lore: "",
        partype: "",
        roles: [""],
        passive: null,
        spells: null,
        championKey: '');
    data.forEach((champ, info) {
      champion = ChampionDetailsModel.fromJson(info);
    });
    return champion;
  }
}
