import 'package:get_it/get_it.dart';
import 'package:variables/src/data/client/champion_client.dart';
import 'package:variables/src/data/client/champion_client_impl.dart';
import 'package:variables/src/data/repositories/champion_repository.dart';
import 'package:variables/src/domain/repositories/champion_repository_impl.dart';
import 'package:variables/src/domain/usecases/get_all_champions_use_case_imp.dart';
import 'package:variables/src/domain/usecases/get_champion_details_use_case_impl.dart';
import 'package:variables/src/presentation/usecases/get_all_champions_use_case_.dart';
import 'package:variables/src/presentation/usecases/get_champion_details_use_case.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<GetAllChampionsUseCase>(
    () => GetAllChampionsUseCaseImpl(
      locator.get<IChampionRepository>(),
    ),
  );
  locator.registerLazySingleton<IChampionClient>(
    () => ChampionClient(),
  );

  locator.registerLazySingleton<IChampionRepository>(
    () => ChampionRepository(
      locator.get<IChampionClient>(),
    ),
  );
  locator.registerLazySingleton<GetChampionDetailsUseCase>(
    () => GetChampionDetailsUseCaseImpl(
      locator.get<IChampionRepository>(),
    ),
  );
}
