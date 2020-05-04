import 'package:flutter/material.dart';
import 'package:imc_calculator/src/views/home_view.dart';

class ImcCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
      theme: ThemeData(
        primaryColor: Colors.amber[800],
        fontFamily: 'AbrilFatface',
        accentColor: Colors.black54,
        appBarTheme: AppBarTheme(
          elevation: 5,
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: 'ShadowsIntoLight',
              color: Colors.black,
              fontSize: 34,
            ),
          ),
        ),
        canvasColor: Colors.yellow[100],
      ),
    );
  }
}
