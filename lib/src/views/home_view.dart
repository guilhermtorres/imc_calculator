import 'package:flutter/material.dart';
import 'package:imc_calculator/src/components/imc_calculator_components.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
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
            onPressed: () {
              setState(() {
                weightController.clear();
                heightController.clear();
              });
            },
          )
        ],
      ),
      body: ImcCalculatorComponents(
        weightController: weightController,
        heightController: heightController,
      ),
    );
  }
}
