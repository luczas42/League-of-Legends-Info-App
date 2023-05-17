import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:variables/src/locator.dart';
import 'package:variables/src/presentation/details/details_page.dart';

import 'presentation/home/home_page.dart';

void main(){
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        name: "home",
        path: "/",
        builder: (context, state) =>
            HomePage(iGetAllChampionsUseCase: locator.get()),
        routes: [
          GoRoute(
            name: "details",
            path: "details/:id",
            builder: (context, state) => DetailsPage(
                championId: state.pathParameters["id"]!,
                getChampionDetailsUseCase: locator.get()),
          )
        ],
      ),
    ],
  );

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'SourceSerif',
        primaryColor: const Color.fromRGBO(3, 151, 171, 1),
      ),
      routerConfig: _router,
    );
  }
}
