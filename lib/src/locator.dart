import 'package:get_it/get_it.dart';
import 'package:variables/src/data/client/champion_client.dart';
import 'package:variables/src/data/repositories/champion_repository.dart';

final locator = GetIt.instance;

void setup(){
  locator.registerLazySingleton<ChampionRepository>(() => ChampionRepository());
  locator.registerLazySingleton<ChampionClient>(() => ChampionClient());
}