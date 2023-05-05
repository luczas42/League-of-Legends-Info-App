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
        primarySwatch: Colors.blue,
      ),
      home: const TelaPotente(),
    );
  }
}

class TelaPotente extends StatelessWidget {
  const TelaPotente({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.red[200],
            height: 80,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Container(
                  color: Colors.yellow[200],
                  height: 40,
                  width: 40,
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Container(
                  color: Colors.purple[200],
                  height: 30,
                  width: 140,
                ),
                Expanded(
                  flex: 3,
                  child: Container(),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    shape: BoxShape.circle,
                  ),
                  height: 30,
                  width: 30,
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    shape: BoxShape.circle,
                  ),
                  height: 30,
                  width: 30,
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green[200],
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    color: Colors.purple[200],
                    height: 180,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.yellow[200],
                          height: 160,
                          width: 160,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              color: Colors.lightBlue[200],
                              height: 40,
                              width: 160,
                            ),
                            Container(
                              color: Colors.lightBlue[200],
                              height: 40,
                              width: 160,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.blue[200],
            height: 80,
          )
        ],
      ),
    );
  }
}
