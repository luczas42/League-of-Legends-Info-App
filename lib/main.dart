import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'SourceSerif',
          primaryColor: Color.fromRGBO(3, 151, 171, 1)),

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
        titleTextStyle: TextStyle(
            fontFamily: 'SourceSerif',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(240, 230, 210, 1)),
        backgroundColor: Color.fromRGBO(9, 20, 40, 1),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Color.fromRGBO(200, 155, 60, 1),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipOval(
                child: Image.asset('lib/images/photo.jpg'),
              ),
            ),
          ),
        ),
        title: Text('Lucsaz42'),
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
              color: Color.fromRGBO(30, 35, 40, 1),
              child: ListView(
                children: const [
                  ChampionCard(
                    imageUrl:
                        'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Samira_20.jpg',
                    championName: 'Samira',
                    favoriteSkin: 'High Noon Samira',
                  ),
                  ChampionCard(
                      imageUrl:
                          'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Jinx_13.jpg',
                      championName: 'Jinx',
                      favoriteSkin: 'Odyssey Jinx'),
                  ChampionCard(
                      imageUrl:
                          'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Aatrox_7.jpg',
                      championName: 'Aatrox',
                      favoriteSkin: 'Blood Moon Aatrox'),
                  ChampionCard(
                      imageUrl:
                          'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Jhin_5.jpg',
                      championName: 'Jhin',
                      favoriteSkin: 'Dark Cosmic Jhin'),
                  ChampionCard(
                      imageUrl:
                          'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Gwen_11.jpg',
                      championName: 'Gwen',
                      favoriteSkin: 'Cafe Cuties Gwen')
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(9, 20, 40, 1),
        selectedItemColor: Color.fromRGBO(3, 151, 171, 1),
        unselectedItemColor: Color.fromRGBO(240, 230, 210, 1),
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
    required this.imageUrl,
    required this.championName,
    required this.favoriteSkin,
  });

  final String imageUrl;
  final String championName;
  final String favoriteSkin;

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
            color: Color.fromRGBO(9, 20, 40, 1),
            border:
                Border.all(color: Color.fromRGBO(200, 155, 60, 1), width: 1)),
        padding: EdgeInsets.all(8.0),
        height: 180,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(9, 20, 40, 1),
                  border: Border.all(
                      color: Color.fromRGBO(120, 90, 40, 1), width: 1)),
              child: Image.network(
                widget.imageUrl,
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
                      widget.championName,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(240, 230, 210, 1)),
                    ),
                    Text(
                      widget.favoriteSkin,
                      textAlign: TextAlign.start,
                      style: TextStyle(
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
