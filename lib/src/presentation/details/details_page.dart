import 'package:flutter/material.dart';
import 'package:variables/src/core/utils/remove_html.dart';
import 'package:variables/src/data/model/champion_details_model.dart';
import 'package:variables/src/presentation/usecases/get_champion_details_use_case.dart';
import 'package:variables/src/presentation/widgets/skill_modal.dart';

class DetailsPage extends StatelessWidget {
  final GetChampionDetailsUseCase getChampionDetailsUseCase;

  DetailsPage(
      {super.key,
      required this.championId,
      required this.getChampionDetailsUseCase});
  final String championId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromRGBO(9, 20, 40, 1),
      body: Stack(
        children: [
          FutureBuilder<ChampionDetailsModel>(
            future: getChampionDetailsUseCase(championId),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Erro ${snapshot.error.toString()}",
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              } else if (snapshot.hasData) {
                ChampionDetailsModel champion = snapshot.data!;
                return ListView(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${champion.championId}_0.jpg',
                              ),
                              fit: BoxFit.fitHeight)),
                      height: MediaQuery.of(context).size.height * 0.30,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Color.fromRGBO(9, 20, 40, 1)
                            ],
                          ),
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(9, 20, 40, 1),
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              champion.championName,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(240, 230, 210, 1),
                              ),
                            ),
                            Text(
                              champion.titleToCapitalized(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(200, 155, 60, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SectionDivider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(9, 20, 40, 1)),
                        child: Text(
                          champion.loreToUTF8(),
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(240, 230, 210, 1),
                          ),
                        ),
                      ),
                    ),
                    const SectionDivider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Role",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(200, 155, 60, 1),
                                ),
                              ),
                              Text(
                                champion.roles!.first,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(240, 230, 210, 1),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                "Resource",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(200, 155, 60, 1),
                                ),
                              ),
                              Text(
                                champion.partype!,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromRGBO(240, 230, 210, 1),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SectionDivider(),
                    Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Select a Skill to display info',
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(200, 155, 60, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SpellButton(
                          name: champion.passive!.name!,
                          description: RemoveHtml.descriptionFromHtml(
                              champion.passive!.description!),
                          videoUri: champion.getPassiveVideoUri(),
                          imageUri:
                              champion.passive!.image!.getPassiveImageUri(),
                        ),
                        Flexible(
                          child: SizedBox(
                            height: 100,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: champion.spells!.length,
                              itemBuilder: (context, i) {
                                return SpellButton(
                                    name: champion.spells![i].name!,
                                    description: RemoveHtml.descriptionFromHtml(
                                        champion.spells![i].description!),
                                    videoUri: champion.getSpellVideoUri(i),
                                    imageUri: champion.spells![i].image!
                                        .getSpellImageUri());
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    const SectionDivider(),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [Color.fromRGBO(9, 20, 40, 1), Colors.transparent],
                  ),
                ),
              ),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}

class SpellButton extends StatelessWidget {
  const SpellButton({
    super.key,
    required this.name,
    required this.description,
    required this.videoUri,
    required this.imageUri,
  });

  final String name;
  final String description;
  final String videoUri;
  final String imageUri;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 60,
      icon: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: const Color.fromRGBO(200, 155, 60, 1),
          ),
        ),
        child: Image.network(
          imageUri,
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
            shape: const Border(
                top: BorderSide(
                    color: Color.fromRGBO(200, 155, 60, 1), width: 1)),
            context: context,
            builder: (context) {
              return SkillModal(
                  name: name, description: description, videoUrl: videoUri);
            });
      },
    );
  }
}

class SectionDivider extends StatelessWidget {
  const SectionDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Divider(
        color: Color.fromRGBO(240, 230, 210, 1),
        thickness: 1,
        indent: 16,
        endIndent: 16,
      ),
    );
  }
}
