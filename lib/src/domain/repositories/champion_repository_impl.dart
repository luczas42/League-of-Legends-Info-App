import 'package:variables/src/data/model/champion_details_model.dart';
import 'package:variables/src/data/model/champion_entry_model.dart';

abstract class IChampionRepository{
  Future<List<ChampionEntryModel>> fetchChampions();
  Future<ChampionDetailsModel> fetchChampionByID(String id);
}