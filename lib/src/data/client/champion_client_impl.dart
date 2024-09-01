abstract class IChampionClient{
  Future<Map<String, dynamic>> fetchFromApi();
  Future<Map<String, dynamic>> fetchById(String championId);
}