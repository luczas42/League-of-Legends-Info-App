import 'package:flutter/material.dart';
import 'package:variables/model/champion.dart';

void main() {
  runApp(const MyApp());
}

List<Champion> championList = [
  Champion(
    'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Samira_20.jpg',
    'Samira',
    'High Noon Samira',
  ),
  Champion(
    'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Jinx_13.jpg',
    'Jinx',
    'Odyssey Jinx',
  ),
  Champion(
    'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Aatrox_7.jpg',
    'Aatrox',
    'Blood Moon Aatrox',
  ),
  Champion(
    'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Jhin_5.jpg',
    'Jhin',
    'Dark Cosmic Jhin',
  ),
  Champion(
    'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Gwen_11.jpg',
    'Gwen',
    'Cafe Cuties Gwen',
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'SourceSerif',
          primaryColor: const Color.fromRGBO(3, 151, 171, 1)),
      home: const TelaPotente(),
    );
  }
}

class TelaPotente extends StatelessWidget {
  const TelaPotente({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(
            fontFamily: 'SourceSerif',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(240, 230, 210, 1)),
        backgroundColor: const Color.fromRGBO(9, 20, 40, 1),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 50,
            backgroundColor: const Color.fromRGBO(200, 155, 60, 1),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipOval(
                child: Image.asset('lib/images/photo.jpg'),
              ),
            ),
          ),
        ),
        title: const Text('Lucsaz42'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.add_chart_sharp,
              color: Color.fromRGBO(240, 230, 210, 1),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.add_circle,
              color: Color.fromRGBO(240, 230, 210, 1),
            ),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              color: const Color.fromRGBO(30, 35, 40, 1),
              child: ListView.builder(
                itemCount: championList.length,
                itemBuilder: (context, index) {
                  return ChampionCard(championEntry: championList[index]);
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(9, 20, 40, 1),
        selectedItemColor: const Color.fromRGBO(3, 151, 171, 1),
        unselectedItemColor: const Color.fromRGBO(240, 230, 210, 1),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.door_back_door),
            label: 'Icon 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'Icon 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.catching_pokemon),
            label: 'Icon 3',
          ),
        ],
      ),
    );
  }
}

class ChampionCard extends StatefulWidget {
  const ChampionCard({
    super.key,
    required this.championEntry,
  });

  final Champion championEntry;

  @override
  State<ChampionCard> createState() => _ChampionCardState();
}

class _ChampionCardState extends State<ChampionCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(9, 20, 40, 1),
            border: Border.all(
                color: const Color.fromRGBO(200, 155, 60, 1), width: 1)),
        padding: const EdgeInsets.all(8.0),
        height: 180,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(9, 20, 40, 1),
                  border: Border.all(
                      color: const Color.fromRGBO(120, 90, 40, 1), width: 1)),
              child: Image.network(
                widget.championEntry.imageUrl,
                height: 160,
                width: 160,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.championEntry.championName,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(240, 230, 210, 1)),
                    ),
                    Text(
                      widget.championEntry.skinName,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(200, 155, 60, 1)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
