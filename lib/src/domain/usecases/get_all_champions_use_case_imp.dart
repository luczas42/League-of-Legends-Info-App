import 'package:variables/src/domain/repositories/champion_repository_impl.dart';
import 'package:variables/src/presentation/usecases/get_all_champions_use_case_.dart';

import '../../data/model/champion_entry_model.dart';

class GetAllChampionsUseCaseImpl implements GetAllChampionsUseCase {
  final IChampionRepository iChampionRepository;

  GetAllChampionsUseCaseImpl(this.iChampionRepository);

  @override
  Future<List<ChampionEntryModel>> call() async {
    return await iChampionRepository.fetchChampions();
  }
}
