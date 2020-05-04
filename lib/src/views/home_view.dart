import 'package:flutter/material.dart';

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
      ),
      body: Center(
        child: Text(
          'Aqui vai o corpo do app!',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
