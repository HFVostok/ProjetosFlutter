import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Básico ', // Define o título do aplicativo
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Básico'), // Define o título da barra de aplicativos
        ),
        body: Center(
          child: Container(
            width: 500, // Define a largura do Container
            height: 500, // Define a altura do Container
            color: Colors.blue, // Define a cor de fundo do Container
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Alinha os widgets filhos verticalmente ao centro
              children: <Widget>[
                Text('Filho Widget 1', // Texto do primeiro widget
                  style: TextStyle(
                    color: Colors.white, // Define a cor do texto
                    fontSize: 40, // Define o tamanho da fonte
                  ),
                ),
                //====================================================
                SizedBox(height: 50), // Espaço vertical entre os widgets
                Container(
                  width: 100, // Define a largura do Container 2
                  height: 50, // Define a altura do Container 2
                  color: Colors.green, // Define a cor de fundo do Container 2
                  child: Center(
                    child: Text('Filho Widget 2', // Texto do segundo widget
                      style: TextStyle(
                        color: Colors.white, // Define a cor do texto
                        fontSize: 16, // Define o tamanho da fonte
                      ),
                    ),
                  ),
                ),
                //=======================================================
                SizedBox(height: 20), // Espaço vertical entre os widgets
                Container(
                  width: 140, // Define a largura do Container 3
                  height: 120, // Define a altura do Container 3
                  color: Colors.orange, // Define a cor de fundo do Container 3
                  child: Center(
                    child: Text('Filho Widget 3', // Texto do terceiro widget
                      style: TextStyle(
                        color: Colors.white, // Define a cor do texto
                        fontSize: 23, // Define o tamanho da fonte
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
