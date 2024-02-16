import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(SorteioNumeroApp());
}

class SorteioNumeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Sorteio(),
    );
  }
}

class Sorteio extends StatefulWidget {
  @override
  _SorteioState createState() => _SorteioState();
}

class _SorteioState extends State<Sorteio> {
  TextEditingController _controllerNumero1 = TextEditingController();
  TextEditingController _controllerChute = TextEditingController();
  String _resultado = '';
  int _numeroSorteado = 0;

  void _sorte() {
    Random random = Random();
    _numeroSorteado =
        random.nextInt(100); // Gera um número aleatório entre 0 e 99
    setState(() {
      _resultado = 'Número sorteado: $_numeroSorteado';
    });
  }

  void _comparar() {
    int chute = _numeroSorteado;
    if (chute != null) {
      if (chute == _numeroSorteado) {
        setState(() {
          _resultado = 'Parabéns! Você acertou!';
        });
      } else {
        setState(() {
          _resultado = 'Você errou. Tente novamente.';
        });
      }
    } else {
      setState(() {
        _resultado = 'Por favor, insira um número válido.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sorteio de Números Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controllerNumero1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 1'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _sorte,
              child: Text('Sortear'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _controllerChute,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Seu chute'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _comparar,
              child: Text('Comparar'),
            ),
            SizedBox(height: 16.0),
            Text(
              _resultado,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
