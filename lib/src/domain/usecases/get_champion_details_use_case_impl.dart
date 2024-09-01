import 'package:variables/src/data/model/champion_details_model.dart';
import 'package:variables/src/presentation/usecases/get_champion_details_use_case.dart';

import '../repositories/champion_repository_impl.dart';

class GetChampionDetailsUseCaseImpl implements GetChampionDetailsUseCase{
  final IChampionRepository iChampionRepository;

  GetChampionDetailsUseCaseImpl(this.iChampionRepository);
  
  @override
  Future<ChampionDetailsModel> call(String championId) async{
    return await iChampionRepository.fetchChampionByID(championId);
  }

}
