import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:variables/src/data/client/champion_client_impl.dart';

class ChampionClient implements IChampionClient {
  final client = http.Client();

  @override
  Future<Map<String, dynamic>> fetchFromApi() async {
    final response = await client.get(
      Uri.parse(
          "http://ddragon.leagueoflegends.com/cdn/13.9.1/data/en_US/champion.json"),
    );
    final decodedJson = json.decode(response.body);
    final Map<String, dynamic> data = decodedJson['data'];
    return data;
  }
  
  @override
  Future<Map<String, dynamic>> fetchById(String championId) async {
    final response = await client.get(Uri.parse("http://ddragon.leagueoflegends.com/cdn/13.9.1/data/en_US/champion/$championId.json"));
    final decodedJson = json.decode(response.body);
    final Map<String,dynamic> data = decodedJson['data'];
    return data;
  }
}
