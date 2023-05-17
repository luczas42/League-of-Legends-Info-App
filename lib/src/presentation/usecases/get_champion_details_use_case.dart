import 'package:variables/src/data/model/champion_details_model.dart';
import 'package:variables/src/data/model/champion_entry_model.dart';

abstract class GetChampionDetailsUseCase{
  Future<ChampionDetailsModel> call(String championId);
}