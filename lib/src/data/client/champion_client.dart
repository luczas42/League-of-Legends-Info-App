import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:variables/src/data/repositories/champion_repository.dart';

import '../../domain/model/champion.dart';

class ChampionClient {
  final client = http.Client();

  Future<Map<String, dynamic>> fetchFromApi() async {
    final response = await client.get(
      Uri.parse(
          "http://ddragon.leagueoflegends.com/cdn/13.9.1/data/en_US/champion.json"),
    );
    final decodedJson = json.decode(response.body);
    final Map<String, dynamic> data = decodedJson['data'];
    return data;
  }
}
