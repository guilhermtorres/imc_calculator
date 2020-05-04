import 'package:flutter/material.dart';

GlobalKey<FormState> formKey = GlobalKey<FormState>();
final globalKey = GlobalKey<_ImcCalculatorComponentsState>();

class ImcCalculatorComponents extends StatefulWidget {
  final TextEditingController weightController;
  final TextEditingController heightController;
  ImcCalculatorComponents({this.weightController, this.heightController});
  @override
  _ImcCalculatorComponentsState createState() => _ImcCalculatorComponentsState();
}

class _ImcCalculatorComponentsState extends State<ImcCalculatorComponents> {
  void calculate() {
    setState(() {
      double weight = double.parse(widget.weightController.text);
      double height = double.parse(widget.heightController.text) / 100;
      double imc = weight / (height * height);
      if (imc < 18.6) {
        infoText = 'Abaixo do Peso (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 18.6 && imc < 24.9) {
        infoText = 'Peso Ideal (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 24.9 && imc < 29.9) {
        infoText = 'Levemente Acima do Peso (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 29.9 && imc < 34.9) {
        infoText = 'Obesidade Grau I (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 34.9 && imc < 39.9) {
        infoText = 'Obesidade Grau II (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 40 && imc < 59.9) {
        infoText = 'Obesidade Grau III (${imc.toStringAsPrecision(3)})';
      } else {
        infoText = 'Operação Inválida (${imc.toStringAsPrecision(3)})';
      }
    });
  }

  String infoText = 'Informe suas Medidas';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                'assets/images/fit_icon.png',
                height: 180,
                width: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                controller: widget.weightController,
                validator: (value) {
                  if (value.isEmpty)
                    return 'Insira seu Peso!';
                  else
                    return null;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintText: 'Digite aqui o seu Peso em Kg',
                  hintStyle: TextStyle(fontSize: 16, color: Colors.black26),
                  labelText: 'Peso (Kg)',
                  labelStyle: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty)
                    return 'Insira sua Altura!';
                  else
                    return null;
                },
                controller: widget.heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintText: 'Digite aqui a sua Altura em Cm',
                  hintStyle: TextStyle(fontSize: 16, color: Colors.black26),
                  labelText: 'Altura (Cm)',
                  labelStyle: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      calculate();
                    }
                  },
                  color: Theme.of(context).primaryColor,
                  elevation: 10,
                  child: Text(
                    'Calcular!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              formKey.currentState != null ? formKey.currentState.validate() ? infoText : 'Informe suas Medidas' : ' ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
              ),
            )
          ],
        ),
      ),
    );
  }
}
