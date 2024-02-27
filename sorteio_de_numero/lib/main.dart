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
  TextEditingController _controllerChute = TextEditingController();

  String _resultado = '';
  int _numeroSorteado = 0;
  int chute = 0;



  void _sortearNumero() {
    Random random = Random();
    _numeroSorteado =
        random.nextInt(100); // Gera um número aleatório entre 0 e 99
    setState(() {
      _resultado = 'Número sorteado: $_numeroSorteado';
    });
  }

  @override
  void initiState() {
    super.initState();
     _sortearNumero();
  }

  void _comparar() {
    if (chute != null) {
      if (chute == _numeroSorteado) {
        setState(() {
          _resultado = 'Parabéns! Você acertou!';
        });
      } else if (chute < _numeroSorteado) {
        _resultado = 'O valor esta acima';
      } else if (chute > _numeroSorteado) {
        _resultado = 'O valor esta abaixo';
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
              controller: _controllerChute,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Seu chute'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _comparar();
              },
              child: Text('Palpite'),
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
