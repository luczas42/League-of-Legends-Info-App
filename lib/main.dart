import 'dart:math';

import 'package:flutter/material.dart';
import 'package:variables/model/champion.dart';
import 'package:variables/repository/champion_repository.dart';

void main() {
  runApp(const MyApp());
}

ChampionRepository repository = ChampionRepository();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
              child: FutureBuilder<List<Champion>>(
                future: repository.fecthChampions(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Erro ${snapshot.error.toString()}",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    return ChampionListView(
                      champions: snapshot.data!,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
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

class ChampionListView extends StatelessWidget {
  const ChampionListView({super.key, required this.champions});
  final List<Champion> champions;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: champions.length,
      itemBuilder: (context, index) {
        return ChampionCard(championEntry: champions[index]);
      },
    );
  }
}

class ChampionCard extends StatelessWidget {
  const ChampionCard({
    super.key,
    required this.championEntry,
  });

  final Champion championEntry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(9, 20, 40, 1),
          border: Border.all(
              color: const Color.fromRGBO(200, 155, 60, 1), width: 1),
        ),
        padding: const EdgeInsets.all(8.0),
        height: 190 * MediaQuery.textScaleFactorOf(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(9, 20, 40, 1),
                  border: Border.all(
                      color: const Color.fromRGBO(120, 90, 40, 1), width: 1)),
              child: Image.network(
                'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${championEntry.splashUrl}_0.jpg',
                height: 150 * MediaQuery.textScaleFactorOf(context),
                width: 150 * MediaQuery.textScaleFactorOf(context),
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
                      championEntry.championName,
                      textAlign: TextAlign.start,
                      textScaleFactor: ScaleSize.textScaleFactor(context),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(240, 230, 210, 1),
                      ),
                    ),
                    Text(
                      championEntry.titleToCapitalized(),
                      textAlign: TextAlign.start,
                      textScaleFactor: ScaleSize.textScaleFactor(context),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(200, 155, 60, 1),
                      ),
                    ),
                    Text(
                      championEntry.blurb,
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textScaleFactor: ScaleSize.textScaleFactor(context),
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(200, 155, 60, 1),
                      ),
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

class ScaleSize {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }
}
