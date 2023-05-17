import 'package:flutter/material.dart';
import 'package:variables/src/presentation/usecases/get_all_champions_use_case_.dart';

import '../../data/model/champion_entry_model.dart';
import '../widgets/champion_card_item.dart';


class HomePage extends StatelessWidget {
  final GetAllChampionsUseCase iGetAllChampionsUseCase;
  const HomePage({super.key, required this.iGetAllChampionsUseCase});
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
                child: Image.asset('assets/images/photo.jpg'),
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
              child: FutureBuilder<List<ChampionEntryModel>>(
                future: iGetAllChampionsUseCase(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Erro ${snapshot.error.toString()}",
                        style: const TextStyle(color: Colors.white),
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
  final List<ChampionEntryModel> champions;
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
