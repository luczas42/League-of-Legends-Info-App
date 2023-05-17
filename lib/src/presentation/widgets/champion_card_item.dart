import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/size_config.dart';
import '../../data/model/champion_entry_model.dart';

class ChampionCard extends StatelessWidget {
  const ChampionCard({
    super.key,
    required this.championEntry,
  });

  final ChampionEntryModel championEntry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: InkWell(
        onTap: () => context.goNamed("details",
            pathParameters: {"id": championEntry.championId}),
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
                  'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/${championEntry.championId}_0.jpg',
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
      ),
    );
  }
}
