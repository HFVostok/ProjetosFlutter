// Exercicio 10

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animação Simples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimationExample(),
    );
  }
}

class AnimationExample extends StatefulWidget {
  @override
  _AnimationExampleState createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> {
  // Variável para armazenar a cor atual do botão
  Color _buttonColor = Colors.blue;

  // Método para alternar a cor do botão
  void _toggleColor() {
    setState(() {
      // Se a cor atual for azul, muda para vermelho; senão, muda para azul
      _buttonColor = _buttonColor == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animação Simples'),
      ),
      body: Center(
        child: GestureDetector(
          // Widget GestureDetector para detectar toques no botão
          onTap: () {
            _toggleColor(); // Chama o método para alternar a cor
          },
          child: AnimatedContainer(
            // Widget AnimatedContainer para animar a cor do contêiner (botão)
            duration: Duration(milliseconds: 300), // Duração da animação
            width: 200, // Largura do contêiner
            height: 50, // Altura do contêiner
            color: _buttonColor, // Cor do contêiner
            child: Center(
              child: Text(
                'Clique-me',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
