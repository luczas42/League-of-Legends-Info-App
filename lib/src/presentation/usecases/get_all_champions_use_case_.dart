import '../../data/model/champion_entry_model.dart';

abstract class GetAllChampionsUseCase {
  Future<List<ChampionEntryModel>> call();
}
