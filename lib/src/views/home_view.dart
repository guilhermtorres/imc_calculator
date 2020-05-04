import 'package:flutter/material.dart';
import 'package:imc_calculator/src/components/imc_calculator_components.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculadora de IMC',
        ),
        centerTitle: true,
        elevation: 5,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.refresh,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ImcCalculatorComponents(),
    );
  }
}
